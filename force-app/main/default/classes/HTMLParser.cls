public with sharing class HTMLParser {
    public HTMLParser() {

    }
    public static String[] scan(String source) {
        string src='<!DOCTYPE html [<!ENTITY nbsp " ">]>'+source;
		String[] values = new String[0];
        src=src.replaceAll('<(br|hr)>','');
        System.debug(System.loggingLevel.Error,src);
        XmlStreamReader r = new XmlStreamReader(src);
        Integer retry = 0;
        Boolean inRow = false, inCol = false;
        while(r.hasNext() && retry < 3) {
            try {
            	r.next();
                retry = 0;
                if(r.geteventtype()==xmltag.start_element && r.getlocalname()=='tr') { 
                    values.add('');
                    inRow = true;
                }
                if(r.geteventtype()==xmltag.end_element && r.getlocalname()=='tr') {
                    inrow = incol = false;
                }
                if(r.geteventtype()==xmltag.start_element && r.getlocalname()=='td') {
                    incol = true;
                }
                if(r.geteventtype()==xmltag.end_element && r.getlocalname()=='td') {
                    incol = false;
                    if(!values.isempty())
                        values[values.size()-1]+=';,';
                }
                if(inRow&&inCol&&r.geteventtype()==xmltag.characters) {
                    values[values.size()-1]+=r.gettext();
                }
            } catch(exception e) {
                retry++;
            }
        }
    	return values;
    }
}
