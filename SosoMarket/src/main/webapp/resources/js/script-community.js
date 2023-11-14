// Get the input element and the posts container
		var searchInput = document.getElementById('search');

		// Add an event listener to the input field
		searchInput.addEventListener('input', function() {
			var searchText = searchInput.value.toLowerCase();

			// Get all encapsulate divs
			var encapsulates = document.querySelectorAll('.encapsulate');

			// Loop through the encapsulate divs and hide/show based on search input
			encapsulates.forEach(function(encapsulate) {
				var postContainer = encapsulate
						.querySelector('.post-container');
				var postTextContent = postContainer.textContent.toLowerCase();

				if (postTextContent.includes(searchText)) {
					encapsulate.style.display = '';
				} else {
					encapsulate.style.display = 'none';
				}
			});
		});
		
		
		 $(document).ready(function() {
     // Loop through each post-container
     $('.post-container').each(function() {
         var postDetail = $(this).find('.post-detail');
         var postId = $(this).data('post-id');
         var content = postDetail.html();

         // Truncate the content
         postDetail.html(content.substring(0, 300)
             + '...  '
             + '<a href="/SosoMarket/CommunityPostDetail.do?postId='
             + postId + '" class="read-more-link">Read more</a>');
     });
 });
 
 $(document).ready(function(){
	 $('.post-container').click(function(){ 
		 var postId=$(this).data('post-id'); 
		 window.location.href= '/SosoMarket/CommunityPostDetail.do?postId=' + postId;
     });
 });