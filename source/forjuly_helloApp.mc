using Toybox.Application as App;

class forjuly_helloApp extends App.AppBase {

    //! Return the initial view of your application here
    function getInitialView() {
        return [ new forjuly_helloView() ];
    }

}