/**
 * 
 */
	$(function(){
		var startDate = $('#startDate').val();
		if(startDate == '' || startDate == null){
			var date = new Date();
			var yyyy = date.getFullYear();
			var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
			var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	
			$('#startDate').val(yyyy+'-'+mm+'-'+dd);
			$('#endDate').val(yyyy+'-'+mm+'-'+dd);
		}
		
		//[오늘, 내일, 7일, 1개월, 6개월]버튼 클릭하면 색 바뀜
		$('.dbtn').on('click', function() {
			var clickbtn = $(this);

			$('.dbtn').each(function(idx, item) {
				if (clickbtn != $(this)) {
					$(this).removeClass('btn-success');
					$(this).addClass('btn-outline-success');
				}
			})
			
			var v = $(this).val() ;
			
			var date = new Date();
			var mv = 1;
			var dv = 0;
			
			if(v == '어제'){
				console.log("gg"+v);
				dv = -1;
			}else if(v == '7일'){
				dv = -7;
			}else if(v == '1개월'){
				mv -= 1; 
			}else if(v == '6개월'){
				mv -= 6;
			}
			
			var yyyy = date.getFullYear();
			var mm = date.getMonth()+mv > 9 ? date.getMonth()+mv : '0' + (date.getMonth()+mv);
			var dd = date.getDate()+dv > 9 ? date.getDate()+dv : '0' + (date.getDate()+dv);
			
			var yyyy2 = date.getFullYear();
			var mm2 = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
			var dd2 = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
			
		
			$('#startDate').val(yyyy+"-"+mm+"-"+dd);			
			$('#endDate').val(yyyy2+"-"+mm2+"-"+dd2);
			
			$(this).removeClass('btn-outline-success');
			$(this).addClass('btn-success');
		
		})
		
		
		//input date 값 검사
		$('input[type=date]').on('change',getDate)
		
		$('#searchform').submit(getDate)
		
		function getDate(){
			var startD = $('#startDate').val();
			var endD = $('#endDate').val();
			var startresult = startD.replace(/-/g,'');
			var endresult = endD.replace(/-/g,'');
			if(startresult - endresult > 0){
				alert('날짜를 다시선택해주세요....')
				return false;
			}else{
				return true;
			}
			
		}
		
//	 	1. 전체 누르면 전부다 클릭 되도록, 2. '전체'눌려져 있을때 다른거 누르면 전체 체크 해제
		$(".searchChb").on('click',function(){
			console.log("dddd");
			var value = $(this).val();
			if(value == '-1'){
				var c = $(this).prop('checked');
				$('input[name='+$(this).attr('name')+']').each( function(idx, item){
						$(this).prop('checked',c);
					}
				)
				return;
			}else{
				if($('input[name='+$(this).attr("name")+']').first().prop('checked')){
					$('input[name='+$(this).attr("name")+']').first().prop('checked',false);
				}
			}
		})
		
		
		//주소 | 빼고 나오게 하기
		$('.addr').each(function(idx,item){
			var addr = $(this).text();
			addr =  addr.replace(/\|/g, ' ');
			$(this).text(addr);			
		})
	})
	

