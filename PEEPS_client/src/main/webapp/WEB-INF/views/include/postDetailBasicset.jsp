<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap')
	;
</style>

<style>
input[type="search"] {
   padding-left: 10px;
   float: left;
   height: 30px;
   border-radius: 30px;
   border-top-right-radius: 0;
   border-bottom-right-radius: 0;
   border: none;
   width: 200px;
}

nav ul li button {
   background-color: #EEF0ED;
   height: 30px;
   border: none;
   border-radius: 30px;
   border-top-left-radius: 0;
   border-bottom-left-radius: 0;
}

.post_wrap {
	width: 1000px;
	height: auto;
	background-color: white;
	margin: 200px auto;
	border: 1px solid #eef0ed;
}

.post {
	margin: 80px auto 65px;
}

.post_top_wrap {
	padding-bottom: 15px;
}

.postuserphoto {
	width: 50px;
	height: 50px;
	border-radius: 50px;
}

.postuserphoto, .memberid, .followchk {
	float: left;
	margin-right: 15px;
}

.memberid, .followchk {
	/* height: 50px;
	line-height: 300%; */
	font-weight: 800;
	font-size: 20px;
	margin-top: 10px;
}

.sessionmid {
	float: left;
	margin-right: 15px;
	font-weight: 800;
	font-size: 20px;
	margin-top: 10px;
}

.followchk {
	color: #aaa;
}

.ptitle {
	width: 800px;
	height: 50px;
	font-size: 2em;
	font-weight: 800;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	display: table-cell;
	vertical-align: middle;
	padding: 10px;
}

.post_datenbutton {
	padding: 15px 5px 0 5px;
}

.pdate {
	float: left;
	font-weight: 800;
	font-size: 20px;
	color: #aaa;
	margin: auto;
}

.deleteBtn, .editBtn {
	background-color: #eef0ed;
	float: right;
	margin-left: 20px;
	font-size: 17px;
	border: 0px solid;
	border-radius: 5px;
	width: 80px;
	height: 45px;
	text-align: center;
	padding: 10px;
}

.carousel-inner>div {
	position: relative;
	height: 100%;
}

.carousel-inner>div>img {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}

.carousel-inner {
	margin: 15px auto;
	width: 800px;
	height: 800px;
	background-color: #ccc;
}

.content {
	margin: 20px 0;
}

.rightside {
	float: right;
}

.cmtdiv {
	margin: 25px 0;
}

.cmtinputarea {
	float: right;
}

.cmttxt {
	resize: none;
	width: 555px;
	height: 50px;
	border: 2px solid #ccc;
	border-radius: 5px;
	display: table-cell;
	vertical-align: middle;
	padding: 10px;
	margin-right: 10px;
}

.cmttxt::-webkit-scrollbar {
	display: none;
}

.cmtbtn {
	border: 0px solid;
	border-radius: 5px;
	width: 70px;
	height: 50px;
}

pre {
	font-size: 1.2em;
	font-family: 'Nanum Gothic', sans-serif;
	width: 800px;
	overflow: auto;
	word-wrap: break-word;
	white-space: pre-wrap;
	white-space: -moz-pre-wrap;
	white-space: -pre-wrap;
	white-space: -o-pre-wrap;
	word-break: break-all;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.deleteBtn {
	background-color: #F5E978;
}

.oneImg {
	text-align: center;
	margin: 20px 0;
	background-color: #ccc;
	width: 800px;
	min-height: 800px;
	position: relative;
}

.oneImg>img {
	position: absolute;
	max-height: 100%;
	max-width: 100%;
	min-width: 800px;
	height: auto;
	margin: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

#divMinHeight {
	min-height: 350px;
}

.likeBtn {
	border: 0px solid;
	background-color: transparent;
}

.likeBtn:focus {
	outline: none;
}

/* ?????? */
.comment {
	resize: none;
	width: 800px;
	height: 50px;
	border: none;
	display: table-cell;
	vertical-align: middle;
	padding: 10px;
	margin-right: 10px;
}

#cmt_re, #cmt_edit, #cmt_del {
	background-color: white;
	border: 0.1px solid #CCC;
	border-radius: 10px;
}

.cmt, #cmt {
	margin-bottom: 10px;
}

#load_cmt {
	width: 300px;
	border: none;
	margin: 12px auto;
}

.reply {
	margin: 10px auto;
	margin-left: 30px;
}

#load_re {
	width: 400px;
	border: none;
	margin: 12px auto;
}

#re_edit, #re_del {
	background-color: white;
	border: 0.1px solid #CCC;
	border-radius: 10px;
}

#editForm {
	margin: 20px auto;
}

#cmttxt_edit {
	width: 400px;
}

.id, .postuserphoto, .memberid:hover {
	cursor: pointer;
}

.cmtdiv>.postuserphoto:hover {
	cursor: default;
}

.id {
	font-weight: 800;
}

body {
	background-color: #fcf9f6;
	font-family: 'Nanum Gothic', sans-serif;
}
</style>

<!--jquery ??????????????? ??????-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous">
</script>

<script>
	//????????? idx ??????
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex
	        .exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(
	        /\+/g, " "));
	}
	
	var postIdx = getParameterByName('idx');
	
	var sessionMidx = "${peeps.m_idx}";
	
    $(document).ready(function() {

        // ?????? ??? ??????
        $('#cmttxt').keyup(function() {
            // ?????? ?????? ???????????? ??????
            var inputStrLen = $(this).val().length;
            if (inputStrLen > 100) {
                alert('100??? ????????? ????????? ???????????????.');
                var userInput = $(this).val().substr(0, 100);
                $(this).val(userInput);
                inputStrLen = 100;
            }
        });

        // ?????? ?????? ??? ??????
        $('#cmttxt_edit').keyup(function() {
            // ?????? ?????? ???????????? ??????
            var inputStrLen = $(this).val().length;
            if (inputStrLen > 100) {
                alert('100??? ????????? ????????? ???????????????.');
                var userInput = $(this).val().substr(0, 100);
                $(this).val(userInput);
                inputStrLen = 100;
            }
        });

        // ??????????????? ??? ????????? (?????? ????????? ????????? ??????)
        $.ajax({
			url: 'http://52.79.234.178:8080/post/rest/detail?idx='+postIdx,
            type: 'GET',
            success: function(data) {
            	
            	var memberid = "";
            	var memberphoto = "";
            	// ?????? ?????? ????????? ??????
            	$.ajax({
            		url: '${pageContext.request.contextPath}/rest/memberInfo',
        			type: 'GET',
        			data: {"mIdx" : data.member_idx},
        			success: function(data){
        				var html = '<img class="postuserphoto" onclick="GoMyPage(' + data.m_idx + ')" src="<spring:url value="/resources/img/'+data.m_photo+'"/>">';
        				   html += '<span class="memberid" onclick="GoMyPage(' + data.m_idx + ')">'+data.id+'</span> ';
        				$('.post_top').append(html);
        			},
        			error: function(e){
        				
        			}
            	});
            	
                var pIdx = data.p_idx;
				
                // ?????? ???????????? ?????? ??????,?????? ?????? ??????
                if (sessionMidx == data.member_idx) {
                    var Btn = '<a class="deleteBtn" href="javascript:deletePost(' +
                        data.p_idx + ');">??????</a>';
                    Btn += '<a class="editBtn" href="<c:url value="/edit?idx=' +
                        data.p_idx +
                        '" />">??????</a>';
                    $('.deBtn').append(Btn);
                }

                $('.ptitle').append(data.p_title);

                var date = data.p_date - 540 * 60 * 1000;
                date = new Date(date).toLocaleDateString();

                $('.pdate').append(date);

                var pcontent = '<pre>' + data.p_content + '</pre>';
                $('.content').append(pcontent);

                if (data.p_loc != "") {
                    var plocHtml = '<img style="width: 30px; height: 30px;" src="<c:url value="/resources/icon/locpic.png"/>">';
                    plocHtml += '<span class="location" style="margin-left: 5px;">' + data.p_loc + '</span>';
                    $('.locSpan').append(plocHtml);
                }

                $('.likes').append(data.p_likes);

            },
            error: function(e) {
                console.log("???????????????ajax??????");
                console.log(e);
            }
        }); // ????????? ajax ???

        // ??????????????? ??? ????????? (?????? ????????? ????????? ????????? ??????)
        $.ajax({
            url: "http://52.79.234.178:8080/post/rest/detail/image?idx=" + postIdx,
            type: 'post',
            success: function(data) {

                // ???????????? ?????? ?????? ????????? ?????? ?????? ????????? ??????
                if (data.length < 1) {
                    $('.content').attr('id', 'divMinHeight');
                }
                
				// ????????? 1???
                if (data.length == 1) {
                    var html = '<div class="oneImg"><img src="http://52.79.234.178:8080/post/resources/fileupload/postfile/' + data[0].f_name + '"/></div>';
                    $('.postpics').append(html);
                }
				
				// ????????? 2??? ??????
                if (data.length > 1) {

                    var html = '<div id="carouselExampleIndicators" class="carousel slide" data-bs-interval="false">';
                    html += '<ol class="carousel-indicators"></ol>';
                    html += '<div class="carousel-inner"></div>';
                    html += '<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">';
                    html += '<span class="carousel-control-prev-icon" aria-hidden="true"></span>';
                    html += '<span class="visually-hidden">Previous</span></a>';
                    html += '<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">';
                    html += '<span class="carousel-control-next-icon" aria-hidden="true"></span>';
                    html += '<span class="visually-hidden">Next</span>';
                    html += '</a></div>';
                    $('.postpics').append(html);

                    var firstImg = $(data).first();
                    var index = 0;

                    $.each(firstImg, function(index, item) {

                        var html1 = '<div class="carousel-item active">';
                        html1 += '<img src="http://52.79.234.178:8080/post/resources/fileupload/postfile/' + item.f_name + '" class="d-block w-100" alt="..."></div>';
                        $('.carousel-inner').append(html1);
                    })

                    var anthrImg = $(data).not(firstImg);
                    $.each(anthrImg, function(index, item) {
                        var html2 = '<div class="carousel-item">';
                        html2 += '<img src="http://52.79.234.178:8080/post/resources/fileupload/postfile/' + item.f_name + '" class="d-block w-100" alt="..."></div>';
                        $('.carousel-inner').append(html2);
                    })
                }

            },
            error: function(e) {
                console.log("???????????????ajax??????");
                console.log(e);
            }
        }) // ?????? ajax ???

        var mIdx = "${peeps.m_idx}";

        var likeInfo = {
            "pIdx": postIdx,
            "mIdx": mIdx
        };
        // ??????????????? ??? ????????? (????????? ?????? ????????? ??????)
        $.ajax({
            url: "http://52.79.234.178:8080/post/rest/likeChk",
            type: 'GET',
            data: likeInfo,
            success: function(data) {

                if (data.likeChk == 1) {
                    var likeHtml = '<img style="width: 30px; height: 30px;" src="<spring:url value="/resources/icon/like1.png"/>">';
                    $('.likeBtn').append(likeHtml);
                } else {
                    var likeHtml = '<img style="width: 30px; height: 30px;" src="<spring:url value="/resources/icon/like0.png"/>">';
                    $('.likeBtn').append(likeHtml);
                }

            },
            error: function(e) {
                console.log("????????? ?????? ajax??????");
                console.log(e);
            }
        }); // ????????? ?????? ajax ???

    }); // document.ready ???

	
	// ????????? ????????? ?????? ??? ?????? ????????? ?????????????????? ??????
	function GoMyPage(idx) {
	
	    $.ajax({
	    	url: '${pageContext.request.contextPath}/rest/memberInfo',
	        type: 'get',
	        data: {
	            "mIdx": idx
	        },
	        success: function(data) {
	
	            location.href = "${pageContext.request.contextPath}/"+data.id;
	        },
	        error: function(e) {
	            console.log("?????? ?????? ??????");
	        }
	    });
	
	}
	
	// ????????? ??????
	function deletePost(pidx) {
	
	    if (confirm('?????????????????????????')) {
	
	        $.ajax({
	            url: "http://52.79.234.178:8080/post/rest/delete?idx=" + pidx,
	            type: 'GET',
	            success: function(data) {
	                var memberid = "${peeps.id}";
	                window.location.href = "${pageContext.request.contextPath}/" + memberid;
	            },
	            error: function(e) {
					console.log(e);
	            }
	
	        });
	
	    }
	};
	
	// ????????? ?????? ??????
	function clickLikeBtn() {
	    var memberidx = "${peeps.m_idx}";
	
	    var likeInfo = {
	        "pIdx": postIdx,
	        "mIdx": memberidx
	    };
	
	    $.ajax({
	        url: "http://52.79.234.178:8080/post/rest/likes",
	        type: 'get',
	        data: likeInfo,
	        success: function(data) {
	
	            $('.likes').empty();
	
	            var html = '<span>' + data.p_likes + '</span>';
	            $('.likes').append(html);
	
	            $('.likeBtn').empty();
	            if (data.likeChk == 1) {
	                var likeHtml = '<img style="width: 30px; height: 30px;" src="<spring:url value="/resources/icon/like1.png"/>">';
	                $('.likeBtn').append(likeHtml);
	            } else {
	                var likeHtml = '<img style="width: 30px; height: 30px;" src="<spring:url value="/resources/icon/like0.png"/>">';
	                $('.likeBtn').append(likeHtml);
	            }
	
	        },
	        error: function(e) {
	            console.log(e);
	            console.log("????????? ajax ??????");
	        }
	
	    }); // ????????? ajax ???
	
	} // clickLikeBtn ?????? ???
</script>

<!-- ?????? ?????? -->
<script>
	// ?????? ?????? ????????? ??? ?????????
	function editComment(idx) {

		var origin = $('.comment .cmt #load_cmt').eq(idx).val();
		var memberId = "${peeps.id}";
		var memberphoto = "${peeps.m_photo}";

		var html = "<div class='editForm'>";
		html += "<img class='postuserphoto' src='<c:url value='/resources/img/"+memberphoto+"'/>'>";
		html += " <span class='id'>" + memberId + "</span>";
		html += "<span id='cmtinputarea'> <textarea rows='10' name='cmt_content' class='cmttxt' id='cmttxt_edit' required>"
				+ origin + "</textarea>";
		html += "<input type='submit' id='cmt_edit_btn' value='??????'><input type='submit' id='cmt_cancle_btn' value='??????'></span></div>";

		$('.comment .cmt').eq(idx).replaceWith(html);
	}

	// ?????? ????????? ??? ?????????
	function replyForm(idx) {

		// ??????????????????
		var memberId = "${peeps.id}";
		var memberphoto = "${peeps.m_photo}";

		var html = "<div class='editForm'>";
		html += "<img class='postuserphoto' src='<c:url value='/resources/img/"+memberphoto+"'/>'>";
		html += "<span class='id'>" + memberId + "</span>";
		html += "<span id='cmtinputarea'> <textarea rows='10' name='cmt_content' class='cmttxt' id='reply_insert' placeholder='????????? ??????????????????' required></textarea>";
		html += "<input type='submit' id='reply_insert_btn' value='??????'><input type='submit' id='reply_cancle_btn' value='??????'></span></div>";

		$('.comment .cmt').eq(idx).append(html);
	}

	// ????????? ?????? ????????? ??? ?????????
	function replyEdit(idx) {

		var origin = $('.comment .cmt .reply #load_re').eq(idx).val();

		// ??????????????????
		var memberId = "${peeps.id}";
		var memberphoto = "${peeps.m_photo}";

		var html = "<div class='editForm'>";
		html += "<img class='postuserphoto' src='<c:url value='/resources/img/"+memberphoto+"'/>'>";
		html += "<span class='id'>" + memberId + "</span>";
		html += "<span id='cmtinputarea'> <textarea rows='10' name='cmt_content' class='cmttxt' id='reply_insert'  required>"
				+ origin + "</textarea>";
		html += "<input type='submit' id='reply_insert_btn' value='??????'><input type='submit' id='reply_cancle_btn' value='??????'></span></div>";

		$('.comment .cmt .reply').eq(idx).replaceWith(html);
	}
</script>

<script>
	loadComment();
	
    function loadComment() {
    	var postIdx = getParameterByName('idx');

        // ??????????????? ??? ????????? (?????? ????????? ??????) 
        $.ajax({
            url: "http://52.79.234.178:8080/post/rest/cmt/select?PostNO=" + postIdx,
            type: 'get',
            data: {
                "postIdx": postIdx
            },
            success: function(data) {
                var comment = data.cmtList;
                var member_idx = data.post.member_idx;

                $('.commentTotal').empty();
                $('.commentTotal').append(data.allCmtRplCnt);

                $('.comment').empty();
                $.each(data.cmtList, function(index, cmt) {
                    // ?????? ?????? ???????????? ajax ?????? (??????)
                    $.ajax({
                        url: '${pageContext.request.contextPath}/rest/memberList',
                        type: 'GET',
                        success: function(data) {

                            $.each(data, function(index, mbr) {

                                if (mbr.m_idx == cmt.member_idx) {

                                    // ????????? ?????? ?????? ??????,?????? ??????
                                    if (cmt.member_idx == sessionMidx) {
                                        $('.comment').append("<div class='cmt' id='" + cmt.cmt_idx + "'><img class='postuserphoto' onclick='GoMyPage(" + cmt.member_idx + ");' src= '<c:url value='/resources/img/"+mbr.m_photo+"'/>'> <span class='id' onclick='GoMyPage(" + cmt.member_idx + ");' >" + mbr.id + "</span> <input type='text' id='load_cmt' value='" + cmt.cmt_content + "'><button id='cmt_re' type='submit'>??????</button> <button id='cmt_edit' type='submit'>??????</button>  <button id='cmt_del' type='submit'>??????</button><br><input type='hidden' id='replytext'></div>");
                                    } else {
                                        $('.comment').append("<div class='cmt' id='" + cmt.cmt_idx + "'><img class='postuserphoto' onclick='GoMyPage(" + cmt.member_idx + ");' src= '<c:url value='/resources/img/"+mbr.m_photo+"'/>'> <span class='id' onclick='GoMyPage(" + cmt.member_idx + ");'>" + mbr.id + "</span> <input type='text' id='load_cmt' value='" + cmt.cmt_content + "'><button id='cmt_re' type='submit'>??????</button> <input id='cmt_edit' type='hidden'><input id='cmt_del' type='hidden'></div>");
                                    }

                                } // if mbr.m_idx == cmt.member_idx ???
                            }); // ?????? each 1 ??? 

                        },
                        error: function(e) {
                            console.log(e);
                        }

                    }); // ?????? ?????? ???????????? ajax ??? (??????)

                    // ?????????
                    $.ajax({
                        url: 'http://52.79.234.178:8080/post/rest/cmt/reply/select',
                        type: 'get',
                        data: {
                            "cmt_idx": cmt.cmt_idx
                        },
                        success: function(data) {
                            $.each(data, function(index, reply) {
                                if (cmt.cmt_idx == reply.comment_idx) {

                                    if (reply.member_idx == sessionMidx) {
                                        // ?????? ?????? ???????????? ajax ?????? (?????????)
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/rest/memberList',
                                            type: 'GET',
                                            success: function(data) {
                                                $.each(data, function(index, mbr) {
                                                    if (mbr.m_idx == reply.member_idx) {
                                                       $('#' + reply.comment_idx).append("<div class='reply' name='" + reply.re_idx + "'><img class='postuserphoto' onclick='GoMyPage(" + mbr.m_idx + ");' src= '<c:url value='/resources/img/"+mbr.m_photo+"'/>'> <span class='id' onclick='GoMyPage(" + mbr.m_idx + ");'> " + mbr.id + " </span> <input type='text' id='load_re' value='" + reply.re_content + "'><button id='re_edit' type='submit'>??????</button>  <button id='re_del' type='submit'>??????</button></div>");
                                                    }
                                                });
                                            },
                                            error: function(e) {
                                                console.log(e);
                                            }
                                        }); // ?????? ?????? ???????????? ajax ??? (?????????)

                                    } else {

                                        // ?????? ?????? ???????????? ajax ?????? (?????????)
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/rest/memberList',
                                            type: 'GET',
                                            success: function(data) {
                                                $.each(data, function(index, mbr) {
                                                	
                                                    if (mbr.m_idx == reply.member_idx) {
                                                    	$('#' + reply.comment_idx).append("<div class='reply' name='" + reply.re_idx + "'><img class='postuserphoto' onclick='GoMyPage(" + mbr.m_idx + ");' src= '<c:url value='/resources/img/"+mbr.m_photo+"'/>'> <span class='id' onclick='GoMyPage(" + mbr.m_idx + ");'> " + mbr.id + "</span> <input type='text' id='load_re' value='" + reply.re_content + "'></div>");
                                                    }

                                                });

                                            },
                                            error: function(e) {
                                                console.log(e);
                                            }

                                        }); // ?????? ?????? ???????????? ajax ??? (?????????)
                                    } // else ???

                                }; // if???
                            }); // each ???
                        },
                        error: function(e) {
                            console.log("????????? ??????");
                        }

                    }); // ????????? ???

                }); // cmtList each1 ???

            },
            error: function(e) {
                console.log("?????? ??????");
            }
        }); // ?????? ajax ???

    }; // ?????? ?????? ?????? ???

    $(function() {

        // ?????? ??????
        $(document).on("click", ".cmtbtn", function() {

            var cmt = $('#cmttxt').val();

            var mIdx = "${peeps.m_idx}";

            if (cmt.trim() == "") {
                alert("????????? ??????????????????");

            } else {
                $.ajax({
                    url: 'http://52.79.234.178:8080/post/rest/cmt/insert',
                    type: 'post',
                    async: false,
                    data: {
                        "post_idx": postIdx,
                        "member_idx": mIdx,
                        "cmt_content": cmt
                    },
                    success: function(data) {
                        $('#cmttxt').val('');
                        loadComment();
                    },
                    error: function() {
                        console.log("?????? ??????");
                    }
                });
            }

        });

        // ?????? ??????
        $(document).on("click", "#cmt_del", function() {

            var idx = $('.comment .cmt #cmt_del').index(this);
            var cmt_idx = document.getElementsByClassName('cmt')[idx].id;

            if (confirm('????????? ?????????????????????????')) {

                $('.comment .cmt').eq(idx).remove();
                $.ajax({
                    url: 'http://52.79.234.178:8080/post/rest/cmt/del',
                    type: 'post',
                    async: false,
                    data: {
                        "cmt_idx": cmt_idx
                    },
                    success: function(data) {
                        if (data == 1) {
                            loadComment();
                        } else {
                            console.log("?????? ??????");
                        }

                    },
                    error: function() {
                        console.log("?????? ??????");
                    }
                });
            }

        });

        // ?????? ??????, ?????? ??????
        $(document).on("click", "#cmt_edit", function() {

            var idx = $('.comment .cmt #cmt_edit').index(this);
            var cmt_idx = document.getElementsByClassName('cmt')[idx].id;

            editComment(idx);

            $("#cmt_edit_btn").click(function() {

                var cmt = $('#cmttxt_edit').val();

                if (cmt.trim() == "") {
                    alert("????????? ??????????????????");
                } else {
                    $.ajax({
                        url: 'http://52.79.234.178:8080/post/rest/cmt/edit',
                        type: 'post',
                        async: false,
                        data: {
                            "cmt_idx": cmt_idx,
                            "cmt_content": cmt
                        },
                        success: function(data) {
                            $('#cmttxt_edit').val('');
                            loadComment();
                        },
                        error: function() {
                            console.log("?????? ??????");
                        }
                    });
                }

            });

            // ?????? ??????
            $("#cmt_cancle_btn").click(function() {
                loadComment();
            });

        });

    })
</script>

<script>
$(function() {

    //????????? ??????
    $(document).on("click", "#cmt_re", function() {

        var idx = $('.comment .cmt #cmt_re').index(this);
        var cmt_idx = document.getElementsByClassName('cmt')[idx].id;
        replyForm(idx);

        $("#reply_insert_btn").click(function() {

            var reply = $('#reply_insert').val();

            if (reply.trim() == "") {
                alert("????????? ??????????????????");
            } else {

                var sessionMidx = "${peeps.m_idx}";
                
                $.ajax({
                    url: 'http://52.79.234.178:8080/post/rest/cmt/reply/insert',
                    type: 'post',
                    data: {
                        "comment_idx": cmt_idx,
                        "member_idx": sessionMidx,
                        "re_content": reply
                    },
                    success: function(data) {
                        $('#reply_insert').val('');
                        loadComment();
                    },
                    error: function() {
                        console.log("????????? ?????? ??????");
                    }
                });
            }
        });

        // ?????? ??????
        $("#reply_cancle_btn").click(function() {
            loadComment();
        });

    });

    // ????????? ??????
    $(document).on("click", "#re_edit", function() {

        var idx = $('.comment .cmt .reply #re_edit').index(this);
        var re_idx = document.getElementsByClassName('reply')[idx].getAttribute('name');

        replyEdit(idx);

        $("#reply_insert_btn").click(function() {

            var reply = $('#reply_insert').val();

            if (reply.trim() == "") {
                alert("????????? ??????????????????");
            } else {
                $.ajax({
                    url: 'http://52.79.234.178:8080/post/rest/cmt/reply/edit',
                    type: 'post',
                    async: false,
                    data: {
                        "re_idx": re_idx,
                        "re_content": reply
                    },
                    success: function(data) {
                        $('#cmttxt_edit').val('');
                        loadComment();
                    },
                    error: function() {
                        console.log("?????????  ??????");
                    }
                });
            }

        });

        // ?????? ??????
        $("#reply_cancle_btn").click(function() {
            loadComment();
        });

    });

    // ????????? ??????
    $(document).on("click", "#re_del", function() {

        var idx = $('.comment .cmt .reply #re_del').index(this);
        var re_idx = document.getElementsByClassName('reply')[idx].getAttribute('name');

        if (confirm('????????? ?????????????????????????')) {

            $('.comment .cmt #reply').eq(idx).remove();
            $.ajax({
                url: 'http://52.79.234.178:8080/post/rest/cmt/reply/del',
                type: 'post',
                async: false,
                data: {
                    "re_idx": re_idx
                },
                success: function(data) {
                    if (data == 1) {
                        loadComment();
                    } else {
                        console.log("?????? ??????");
                    }
                },
                error: function() {
                    console.log("?????? ??????");
                }
            });

        }

    });

})

</script>
