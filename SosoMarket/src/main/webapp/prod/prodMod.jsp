<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    

/* 상품 가격 콤마 표시 */
function comma(str) {
   str = String(str);
   return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
   str = String(str);
   return str.replace(/[^\d]+/g, '');
}

function inputNumberFormat(obj) {
   obj.value = comma(uncomma(obj.value));
}

function inputOnlyNumberFormat(obj) {
   obj.value = onlynumber(uncomma(obj.value));
}

function onlynumber(str) {
   str = String(str);
   return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1');
}
    
        function photoDel(prodPhotoName, cnt) {
            // 파일 삭제 구현, 이미지 div 숨김
            var uploadButton = document.querySelector('.fa-upload');
            var previewDiv = document.getElementById('previewDiv' + cnt);
            $.ajax({
                type: 'GET',
                url: '/SosoMarket/ProdPhotoDel.do',
                data: {
                    prodPhotoName: prodPhotoName
                },
                success: function (response) {
                    alert('삭제되었습니다.');
                    if (uploadButton) {
                        uploadButton.style.display = 'inline-block'; // 사진 삭제 성공 시 이미지 div 숨기고 파일 업로드 표시
                    }
                    if (previewDiv) {
                        previewDiv.style.display = 'none';
                    }

                },
                error: function () {
                    alert('서버 오류로 삭제에 실패했습니다.');
                }
            });
        }

        // 이미지 미리보기
        function readURL(input, previewId, cnt) {
            var previewDiv = document.getElementById('previewDiv' + cnt);
            var reHideDiv = document.getElementById('reHide' + cnt);
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#' + previewId).attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }

            if (previewDiv) {
                previewDiv.style.display = 'inline-block';
            }
            if (reHideDiv) {
                reHideDiv.style.display = 'none';
            }
        }
    </script>
</head>
<body>
   <%
   String memberId = (String) session.getAttribute("memberId");
   %>
   <c:import url="../resources/header.jsp" />
   <!-- BREADCRUMB -->
   <div id="breadcrumb" class="section">
      <!-- container -->
      <div class="container">
         <!-- row -->
         <div class="row">
            <div class="col-md-12">
               <h3 class="breadcrumb-header">상품 수정하기</h3>
               <ul class="breadcrumb-tree">
                  <li><a href="#">소소마켓</a></li>
                  <li class="active">상품 등록</li>
               </ul>
            </div>
         </div>
         <!-- /row -->
      </div>
      <!-- /container -->
   </div>
   <!-- /BREADCRUMB -->

   <!-- SECTION -->
   <div class="section">
      <form action="/SosoMarket/ProdUpdate.do?prodId=${vo.prodId}"
         method="post" enctype="multipart/form-data" id="prodModifyfrm"
         onsubmit="return validateForm();">
         <!-- container -->
         <div class="container">
            <!-- row -->
            <div class="row">

               <div class="col-md-7">
                  <!-- Billing Details -->
                  <div class="billing-details">
                     <input value="<%=memberId%>" name="memberId"
                        style="display: none" />
                     <div class="form-group">
                        <input class="input" type="text" value="${vo.category }"
                           readonly="readonly" style="width: 142px;">
                     </div>
                     <div class="form-group">
                        <input class="input" type="text" name="prodName"
                           placeholder="상품명" required="required" value="${vo.prodName }">
                     </div>
                     <div class="form-group">
                        <input class="input" type="text" name="prodPrice"
                           placeholder="가격을 입력해주세요." required="required"
                           value="${vo.prodPrice }" onkeyup="inputNumberFormat(this);">
                     </div>
                     <div class="form-group">
                        <input class="input" type="text" name="place"
                           placeholder="거래희망장소" required="required"
                           value="<c:out value="${vo.placeTrans}"/>">
                     </div>
                     <div class="order-notes">
                        <textarea class="input" name="prodDscrp"
                           placeholder="상품의 상세한 내용을 작성해주세요." required="required">${vo.prodDscrp}</textarea>
                     </div>

                     <br>
                     <c:forEach var="vo" items="${list}">
                        <div id="previewDiv${cnt}">
                           <img id="preview${cnt}"
                              src="./upload/${vo.prodPhotoName}.png?after" alt="image"
                              style="width: 200px;" /> <br>
                           <div id="reHide${cnt}">
                              <span>${vo.prodPhotoName}.png</span> &nbsp; <a
                                 class="fa fa-trash-o mr-2" id="fileDel"
                                 onclick="photoDel('${vo.prodPhotoName}', ${cnt})"
                                 type="button"></a>
                           </div>
                        </div>
                        <br>
                        <input type="file" name="file${cnt}" id="file${cnt}"
                           onchange="readURL(this, 'preview${cnt}', ${cnt});">
                        <br>
                        <c:set var="cnt" value="${cnt + 1}" />
                     </c:forEach>
                     <input type="submit" class="primary-btn order-submit"
                        value="상품수정하기">
                  </div>
               </div>
            </div>
            <!-- /row -->
         </div>
         <!-- /container -->
      </form>
   </div>
   <!-- /SECTION -->
   <c:import url="../resources/footer.html" />
</body>
</html>