using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;

class forjuly_helloView extends Ui.WatchFace {

    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }


	function getColor(seconds){
		var colors = [Gfx.COLOR_RED,Gfx.COLOR_ORANGE,Gfx.COLOR_YELLOW,Gfx.COLOR_YELLOW,Gfx.COLOR_BLUE,Gfx.COLOR_PURPLE,Gfx.COLOR_WHITE];
		return colors[ seconds % colors.size() ];
	}


    function onUpdate(dc) {
    
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_WHITE);
        dc.drawText(15, 15, Gfx.FONT_LARGE, "7", Gfx.TEXT_JUSTIFY_CENTER);
    
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
 		
 		view.setColor(getColor(clockTime.sec));

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

 
}
