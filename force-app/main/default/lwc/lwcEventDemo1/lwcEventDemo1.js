import { LightningElement } from 'lwc';
 
export default class LwcEventDemo1 extends LightningElement {

    handlenotifyEvent(event){

        console.log(' event handled on shadow boundary' );
    }
    handlenotifyParentEvent(event){

        console.log(' event handled in div tag ');
    }
    handlenotifyOuterParentEvent(event){

        console.log('event handled in ouuter div tag');
    }
    handlehostParent(event){
        console.log('host event handled in parent div');
    }
    handlehostgparent(event){
        console.log(' host event handled in grand parent div');
    }
    handlehosteventshadow(event){

        console.log(' host event handled on shadow boundary' );
    }
}