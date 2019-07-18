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

function transmit_restart(user_id){
	$('#restart_id').val(user_id);
	$('#restartform').submit();
}

function transmit_userditails(user_id){
	$('#borrow_books').html('');
	$("#item_counts").html('');
	$.post("${pageContext.request.contextPath }/user_findUser.action",{"user_id":user_id},function(data){
		$('#details_id').val(data[0].user_id);
		$('#details_name').html(data[0].user_name);
		$('#details_account').html('账号：' + data[0].user_account);
    	$('#details_password').html(data[0].user_password);
    	$('#details_number').html('学号：' + data[0].user_number);
    	$('#details_phone').html('邮箱：' + data[0].user_email);
    	$('#details_image').attr("src","/images" + data[0].user_image);
    	var item_count = 0;
    	if(data[0].borrows){
        	$.each(data[0].borrows,function(){
        		if(this.is_return == "0" ){
	        		var date_to_return = new Date(this.date_to_return.time);
	        		var result0 = date_to_return.getFullYear() + '-' + (date_to_return.getMonth() + 1) + '-' + date_to_return.getDate();
	        		var date_now = new Date();
	           	 	if(date_now > date_to_return){
	           	 		result1 = "<td style='color:red'>是</td>";
	           	 	}else{
	           	 		result1 = '<td>否</td>';
	           	 	}
	        		$('#borrow_books').append("<tr><td>" + this.books.books_id + "</td><td>" + this.books.book.book_name + "</td><td>" 
	        				+ result0 + "</td>" + result1 + "<td><button class='btn btn-info' data-toggle='modal' data-target='#returnbook' onclick='transmit_bookreturn("+ 
	        						this.borrow_id +")'>归还</button></td>" +"</tr>");
	        		item_count++;
        		}
        	})
    	}
    	$("#item_counts").html(item_count);
	},"json");
}

function transmit_useredit(){
	var user_id = $('#details_id').val();
	console.log(user_id);
	$.post("${pageContext.request.contextPath }/user_findUser.action",{"user_id":user_id},function(data){
		$('#edit_id').val(data[0].user_id);
		$('#edit_name').val(data[0].user_name);
		$('#edit_account').val(data[0].user_account);
    	$('#edit_password').val(data[0].user_password);
    	$('#edit_number').val(data[0].user_number);
    	$('#edit_phone').val(data[0].user_email);
    	$('#edit_image').val(data[0].user_image);
	},"json");
}

function transmit_bookreturn(borrow_id){
	$('#borrow_id').val(borrow_id);
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
   
   $('#adduser').on('change',function(){
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
   
   $('#user_edit').on('change',function(){
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
