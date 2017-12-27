function phone2_lengthchk(code){
	if(code.value.length==4){
		document.memberinput_form.phone3.focus();
	}
}
function officeno2_lengthchk(code){
	if(code.value.length==4){
		document.venderinsert_form.officeno3.focus();
	}
}
function busno1_lengthchk(code){
	if(code.value.length==3){
		document.venderinsert_form.busno2.focus();
	}
}
function busno2_lengthchk(code){
	if(code.value.length==2){
		document.venderinsert_form.busno3.focus();
	}
}
function emailcheck(strValue){
      var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_a-zA-Z-]+(\.[_a-zA-Z-]+){1,2}$/;
      //입력을 안했으면
      if(strValue.lenght == 0){
         return false;}
      //이메일 형식에 맞지않으면
      if (!strValue.match(regExp)){
         return false;
      }
      return true;
}
function empnocheck(strValue){
	if(strValue.length==6)
		return true;
	else
		return false;
}
function productcheck(strValue){
	if(strValue.length==13)
		return true;
	else
		return false;
}
function vendercheck(strValue){
	if(strValue.length==4)
		return true;
	else
		return false;
}
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('newaddr').value = fullRoadAddr;
            document.getElementById('oldaddr').value = data.jibunAddress;
            document.getElementById('detailaddr').focus();
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
        }
    }).open();
}
$(document).ready(function(){
	$('#venderDeleteBtn').on("click",function(){
		$('#vendermodalmsg').text("삭제 하시겠습니까?")
		$('#venderDeleteModal').modal('show');
		var delvalue = $('#vendercode').val();
		$('#venderModalDeleteBtn').on('click',function(){
			var url="venderDelete?code="+delvalue;
			$(location).attr('href',url);
		});
	});
	$('#venderconfirmbtn').click(function(){
		var code = $('#vendercode').val()
		if($('#vendercode').val()==""){
			$('#modalmsg').text("코드를 입력해주세요.");
			$('#usebtn').text("확인");
			$('#venderModal').modal('show');
			return;
		}else{
			var boolcode = vendercheck(code);
			if(boolcode==false){
				$('#modalmsg').text("코드번호 4자리를  입력해주세요.");
				$('#venderModal').modal('show');
				return;
			}
			$.ajax({
				type:'Post',
				data:"code="+code,
				datatype:'json',
				url : 'venderConfirm',
				success : function(data){
					if(data>0){
						$('#modalmsg').text("이미 사용중인 번호입니다.");
						$('#usebtn').text("확인");
						$('#venderModal').modal('show');
						$('#vendercode').val('');
						return;
					}else{
						$('#modalmsg').text("사용가능 합니다.");
						$('#usebtn').text("사용");
						$('#venderModal').modal('show');
						$('#venderconfirmchk').attr("value","yes");
						$('#name').focus();
					}
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
	$('#vendersave').click(function(){
		var msg=""
		if($('#venderconfirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요 -";
			$('#modalmsg').text(msg);
			$('#venderModal').modal('show');
			return;
		}else{
			$('.venderinsert_form').submit();
		}
	});
	$('#productDeleteBtn').on("click",function(){
		$('#productmodalmsg').text("삭제 하시겠습니까?")
		$('#productDeleteModal').modal('show');
		var delvalue = $('#productcode').val();
		$('#productModalDeleteBtn').on('click',function(){
			var url="productDelete?code="+delvalue;
			$(location).attr('href',url);
		});
	});
	$('#productconfirmbtn').click(function(){
		var code = $('#code').val()
		if($('#code').val()==""){
			$('#modalmsg').text("코드를 입력해주세요.");
			$('#usebtn').text("확인");
			$('#productModal').modal('show');
			return;
		}else{
			var boolcode = productcheck(code);
			if(boolcode==false){
				$('#modalmsg').text("코드번호 13자리를  입력해주세요.");
				$('#productModal').modal('show');
				return;
			}
			$.ajax({
				type:'Post',
				data:"code="+code,
				datatype:'json',
				url : 'codeConfirm',
				success : function(data){
					if(data>0){
						$('#modalmsg').text("이미 사용중인 번호입니다.");
						$('#usebtn').text("확인");
						$('#productModal').modal('show');
						$('#code').val('');
						return;
					}else{
						$('#modalmsg').text("사용가능 합니다.");
						$('#usebtn').text("사용");
						$('#productModal').modal('show');
						$('#codeconfirmchk').attr("value","yes");
						$('#name').focus();
					}
				},
				error : function(xhr,status,error){
					alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
				}
			});
		}
	});
	$('#productsave').click(function(){
		var msg=""
		if($('#codeconfirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요 -";
			$('#modalmsg').text(msg);
			$('#productModal').modal('show');
			return;
		}else{
			$('.productinsert_form').submit();
		}
	});
	var year = new Date().getFullYear();
	$('#yyyy').attr('value',year);
	var yyyy;
	var mm;
	
	$('#salarytaxdeletebtn').click(function(){
		if($('#yyyy').val()==''||$('#mm').val()==''){
			$('.salarytaxform').attr('action','salaryTaxDelete');
			$('.salarytaxform').submit();
			return;
		}else{
			yyyy=$('#yyyy').val();
			mm=$('#mm').val();
			var msg=yyyy+"년 "+mm+"월 항목이 삭제됩니다."
			var	msg2="계속 하시겠습니까?";
				$('#taxmodalmsg').text(msg);
				$('#taxmodalmsg2').text(msg2);
				$('#salaryTaxModal').modal('show');
				$('#salarytaxusebtn').on('click',function(){
					$('.salarytaxform').attr('action','salaryTaxDelete');
					$('.salarytaxform').submit();
				});
		}
	});
	$('#salarytaxbtn').click(function(){
		if($('#yyyy').val()==''||$('#mm').val()==''){
			$('.salarytaxform').attr('action','salaryTax');
			$('.salarytaxform').submit();
			return;
		}else{
			yyyy=$('#yyyy').val();
			mm=$('#mm').val();
			var msg=yyyy+"년 "+mm+"월 항목이 변경됩니다."
			var	msg2="계속 하시겠습니까?";
				$('#taxmodalmsg').text(msg);
				$('#taxmodalmsg2').text(msg2);
				$('#salaryTaxModal').modal('show');
				$('#salarytaxusebtn').on('click',function(){
					$('.salarytaxform').attr('action','salaryTax');
					$('.salarytaxform').submit();
				});
		}
	});
	$('#salaryDeleteBtn').on("click",function(){
		$('#salarymodalmsg').text("삭제 하시겠습니까?")
		$('#salaryDeleteModal').modal('show');
		var delvalue = $('#salaryempno').val();
		$('#salaryModalDeleteBtn').on('click',function(){
			var url="salaryDelete?empno="+delvalue;
			$(location).attr('href',url);
		});
	});
	

	$('#empnoconfirm').on("click",function(){
		var empno = $('#empno').val()
		if($('#empno').val()==""){
			$('#modalmsg').text("사원번호를 입력해주세요.");
			$('#usebtn').text("확인");
			$('#salaryModal').modal('show');
			return;
		}else{
			var boolempno = empnocheck(empno);
			if(boolempno==false){
				$('#modalmsg').text("6자리만 입력해주세요.");
				$('#salaryModal').modal('show');
				return;
			}
			$.ajax({
				type:'Post',
				data:"empno="+empno,
				datatype:'json',
				url : 'empnoConfirm',
				success : function(data){
					if(data>0){
						$('#modalmsg').text("이미 사용중인 번호입니다.");
						$('#usebtn').text("확인");
						$('#salaryModal').modal('show');
						$('#empno').val('');
						return;
					}else{
						$('#modalmsg').text("사용가능 합니다.");
						$('#usebtn').text("사용");
						$('#salaryModal').modal('show');
						$('#empnoconfirmchk').attr("value","yes");
						$('#name').focus();
					}
				},
				error : function(xhr,status,error){
					alert(xhr.status);
				}
			});
		}
	});
	$('#salarysave').click(function(){
		var msg=""
		if($('#empnoconfirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요 -";
			$('#modalmsg').text(msg);
			$('#salaryModal').modal('show');
			return;
		}else{
			$('.salaryinsert_form').submit();
		}
	});
    var date_input=$('input[id="datepicker"]');
    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
    var options={
      format: 'yyyy/mm/dd',
      container: container,
      todayHighlight: true,
      autoclose: true,
    };
    date_input.datepicker(options);
    $('#example').DataTable( {
    	"order":[[0,"desc"]],
    } );
	$(document).on("keyup","input:text[numberOnly]",function(){
		$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});
	
	$('#confirm').click(function(){
		var email = $('#email').val()
		if($('#email').val()==""){
			$('#modalmsg').text("E-mail을 입력하세요.");
			$('#usebtn').text("확인");
			$('#myModal').modal('show');
			return;
		}else{
			var boolemail = emailcheck(email);
			if(boolemail==false){
				$('#modalmsg').text("E-mail을 형식에 맞게 입력하세요.");
				$('#usebtn').text("확인");
				$('#myModal').modal('show');
				return;
			}
			$.ajax({
				type:'Post',
				data:"email="+email,
				datatype:'json',
				url : 'confirm',
				success : function(data){
					if(data>0){
						$('#modalmsg').text("이미 사용중인 E-mail입니다.");
						$('#usebtn').text("확인");
						$('#myModal').modal('show');
						$('#email').val('');
						return;
					}else{
						$('#modalmsg').text("사용가능 합니다.");
						$('#usebtn').text("사용");
						$('#myModal').modal('show');
						$('#confirmchk').attr("value","yes");
						$('#password').focus();
					}
				},
				error : function(xhr,status,error){
					alert(xhr.status);
				}
			});
		}
	});
	$('#membersave').click(function(){
		var msg=""
		if($('#confirmchk').val()=="no"){
			msg+="- 중복 검사를 하세요 -";
			$('#modalmsg').text(msg);
			$('#myModal').modal('show');
			return;
		}else{
			$('.memberinput_form').submit();
		}
	});
	$('#image').on('click',function(){
		$('input[type=file]').click();
		return false;
	});
	$('#photo').change(function(event){
		var tmppath=URL.createObjectURL(event.target.files[0]);
		$('#image').attr('src',tmppath);
	});
	
	$(document).on('click',"#deletebtn",function(){
		$('#modalmsg').text($(this).val()+"을 삭제 하시겠습니까?")
		$('#deleteModal').modal('show');
		var delvalue = $(this).val();
		$('#delbtn').on('click',function(){
			var input=$("<input>")
			.attr("name","delemail")
			.attr("type","hidden")
			.attr("value",delvalue);
			$('.memberlist_form').append($(input));
			$('.memberlist_form').submit();
		});
	});
	$('#boardDeleteBtn').on("click",function(){
		$('#boardmodalmsg').text("삭제 하시겠습니까?")
		$('#boardDeleteModal').modal('show');
		var delvalue = $('#boardb_seq').val();
		$('#boardModalDeleteBtn').on('click',function(){
			var url="boardDelete?b_seq="+delvalue;
			$(location).attr('href',url);
		});
	});
	function validateEmail(Email) {
	       var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	       return $.trim(Email).match(pattern) ? true : false;
	}
	$('.passfind').on("click",function(){
			$('#passwordModal').modal('show');
	});
	$('#findemail').on("keyup change",function(){
		var email=$('#findemail').val();
		var name=$('#findname').val();
		var result = validateEmail(email);
		if(result){
			$('#findbtn').prop('disabled', false);
		}else{
			$('#findbtn').prop('disabled', true);
		}
		$('#passwordModal').on('hidden.bs.modal',function(e){
			$('#findemail').val("");
			$('#findname').val("");
		});
	});
	$('#findbtn').on("click",function(){
		var email=$('#findemail').val();
		var name=$('#findname').val();
		$.ajax({
				type:'POST',
				data:"email="+email+"&name="+name,
				datatype:'json',
				url : 'passwordFind',
				success : function(data){
					if(data==0){
						$('#modalmessage').text("입력된 정보가 일치하지 않습니다.");
						$('#failpasswordModal').modal('show');
					}else{
						$('#modalmessage').text("새로운 비밀번호가 E-mail로 전송 되었습니다.");
						$('#failpasswordModal').modal('show');
					}
				},
				error : function(xhr,status,error){
					alert(xhr.status);
				}
			});
		$('#passwordModal').on('hidden.bs.modal',function(e){
			$('#findemail').val("");
			$('#findname').val("");
		});
	});
	$(".memberupdate_form").delegate("#password","click",function(){
		$(this).attr('value','');
	});

});