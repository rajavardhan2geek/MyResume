({
	readdata : function(component, event, helper) {
        
        alert(document.querySelector('.cmp2').innerHTML);
        var pcmp = document.querySelector('.displaydata');
            
          pcmp.innerHTML += document.querySelector('.cmp2').innerHTML;
        pcmp.style='display:block';
		
	}
})