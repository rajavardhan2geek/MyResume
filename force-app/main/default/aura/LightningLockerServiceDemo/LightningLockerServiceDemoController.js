({
	readOther : function(component, event, helper) {
		alert(document.querySelector('.cmp2').innerHTML);
	},
    doInit : function(component,event,helper){
        console.log('init cmp');
    },
})