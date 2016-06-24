using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class forjuly_helloView extends Ui.SimpleDataField {

    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }


    function onUpdate(dc) {
        var clockTime = Sys.getClockTime();
        var timeString = Lang.format("$1$:$2$:$3$", [clockTime.hour, clockTime.min.format("%02d"),clockTime.sec.format("%02d")]);
        var view = View.findDrawableById("TimeLabel");

		var left_string = "";
        var right_string = "";
        if(clockTime.sec % 2 == 0 ){
        	left_string = "0_";
        	right_string = "_7";
        } else {
        	left_string = "7_";
        	right_string = "_0";
        }
        
        timeString = left_string + timeString + right_string;
 		view.setText(timeString);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

 
}
