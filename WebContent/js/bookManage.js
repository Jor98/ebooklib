function to_page(page){
		if(page){
		$("#page").val(page);
	}
	document.userForm.submit();
}

function transmit(value){
    //向模态框中传值
    $('#delete_id').val(value);  
}

function transmit_bookditails(book_id){
	$('#books_list').html('');
	$('#details_category').html('类型：');
	$.post("${pageContext.request.contextPath }/book_findBook.action",{"book_id":book_id},function(data){
		$('#details_id').val(data[0].book_id);
		$('#details_name').html(data[0].book_name);
		$('#details_synopsis').html(data[0].book_synopsis);
		$('#item_counts').html(data[0].book_total);
		$('#details_image').attr("src","/images" + data[0].book_image);
		if(data[0].book_cates){
			var category = "";
			$.each(data[0].book_cates,function(){
				category += this.category_name + "&emsp;"
			})
			$('#details_category').append(category);
		}else{
			$('#delcategorybtn').remove();
		}
		if(data[0].bookss){
			$.each(data[0].bookss,function(){
				var result = "<tr><td>" + this.books_id + "</td>";
				if(this.is_borrow == "0"){
					result += "<td>null</td><td>null</td><td>null</td>";
					result += "<td><button class='btn btn-info' data-toggle='modal' data-target='#borrowbooks' onclick='transmit_borrowbooks(&#39" + this.books_id + "&#39)'>借出</button>";
				}else{
					$.each(this.borrow_b,function(){
						if(this.is_return == "0"){
							var borrow_date = new Date(this.borrow_date.time);
			        		var borrow_dateX = borrow_date.getFullYear() + '-' + (borrow_date.getMonth() + 1) + '-' + borrow_date.getDate();
			        		var date_to_return = new Date(this.date_to_return.time);
			        		var date_to_returnX = date_to_return.getFullYear() + '-' + (date_to_return.getMonth() + 1) + '-' + date_to_return.getDate();
	    					result += "<td>" + this.user.user_name + "</td>";
	    					result += "<td>" + borrow_dateX + "</td>";
	    					result += "<td>" + date_to_returnX + "</td>";
	    					result += "<td><button class='btn btn-default' data-toggle='modal' data-target='#returnbook' onclick='transmit_bookreturn(" + this.borrow_id + ")'>归还</button>";
						}
					})
				}
				result += "</td></tr>";
				$('#books_list').append(result);
			})
		}
	},"json");
}

function transmit_bookedit(){
	var book_id = $('#details_id').val();
	$.post("${pageContext.request.contextPath }/book_findBook.action",{"book_id":book_id},function(data){
		$('#edit_id').val(data[0].book_id);
		$('#edit_name').val(data[0].book_name);
		$('#edit_sortnumber').val(data[0].book_sortnumber);
		$('#edit_author').val(data[0].book_author);
		$('#edit_isbn').val(data[0].book_isbn);
    	$('#edit_publishing').val(data[0].book_publishing);
    	$('#edit_synopsis').val(data[0].book_synopsis);
	},"json");
}

function transmit_addbooks(){
	var book_id = $('#details_id').val();
	$.post("${pageContext.request.contextPath }/book_findBook.action",{"book_id":book_id},function(data){
		var books_id = data[0].book_sortnumber + "-" + (data[0].book_total+1);
		$('#addbooks_id').val(books_id);
	},"json");
	$('#add_id').val(book_id);
}

function transmit_bookreturn(borrow_id){
	$('#borrow_id').val(borrow_id);
}

function transmit_borrowbooks(books_id){
	$("#borrow_userid").html('');
	console.log(books_id);
	$('#borrowbooks_id').val(books_id);
	$.post("${pageContext.request.contextPath }/user_findAllUser.action",function(data){
		$(data).each(function(i,n){
			if(i==0){
				$("#borrow_userid").append("<option value='"+n.user_id+"' selected='selected'>"+n.user_name+"</option>");
			}else{
				$("#borrow_userid").append("<option value='"+n.user_id+"'>"+n.user_name+"</option>");
			}
		});
	},"json");
}

function transmit_addcategory(){
	var book_id = $('#details_id').val();
	$("#book_addcategory").html('');
	$('#addcategory_bookid').val(book_id);
	$.post("${pageContext.request.contextPath }/category_findAllCategory.action",function(data){
		$(data).each(function(i,n){
			if(i==0){
				$("#book_addcategory").append("<option value="+n.category_id+" selected='selected'>"+n.category_name+"</option>");
			}else{
				$("#book_addcategory").append("<option value="+n.category_id+">"+n.category_name+"</option>");
			}
		});
	},"json");
}

function transmit_delcategory(){
	var book_id = $('#details_id').val();
	var flag = false;
	$("#book_delcategory").html('');
	$('#delcategory_bookid').val(book_id);
	$.post("${pageContext.request.contextPath }/book_findBook.action",{"book_id":book_id},function(data){
		if(data[0].book_cates){
			$(data[0].book_cates).each(function(i,n){
				if(i==0){
					flag = true;
					$("#book_delcategory").append("<option value="+n.category_id+" selected='selected'>"+n.category_name+"</option>");
    			}else{
    				$("#book_delcategory").append("<option value="+n.category_id+">"+n.category_name+"</option>");
    			}
			})
		}
		if(!flag){
			$("#book_delcategory").append("<option selected='selected'>"+"书本未含有类型"+"</option>");
			$('#delbookcategory_submit').attr("disabled","disabled");
		}
	},"json");
}

$(document).ready(function(){
	var flag = false;
	var edit_flag = false;
	
    $('.mustinput').on('blur',function(){
        if($(this).val()==''){
           $(this).css('border-color','red');
       }else{
           $(this).css('border-color','#ced4da');
       }
   })
   
   $('#registbook').on('change',function(){
	   $('.mustinput').each(function(){
		   flag = true;
            if ($(this).val()=='') {
                flag=false;
            }
        })
	   if(flag){
		   $('#add_submit').removeAttr("disabled");
	   }else{
		   $('#add_submit').attr("disabled","disabled");
	   }
   })
   
   $('.mustinput_edit').on('blur',function(){
        if($(this).val()==''){
           $(this).css('border-color','red');
       }else{
           $(this).css('border-color','#ced4da');
       }
   })
   
   $('#book_edit').on('change',function(){
	   $('.mustinput_edit').each(function(){
		   edit_flag = true;
            if ($(this).val()=='') {
                flag=false;
            }
        })
	   if(edit_flag){
		   $('#edit_submit').removeAttr("disabled");
	   }else{
		   $('#edit_submit').attr("disabled","disabled");
	   }
   })
});