//
//  Action.js
//  Bookmarker
//
//  Created by T Michael Rogers on 5/7/15.
//  Copyright (c) 2015 Apress. All rights reserved.
//

var Action = function() {}

Action.prototype = {
    
    run: function(arguments) {
        arguments.completionFunction({ "currentUrl" : document.URL })
    },
    
    finalize: function(arguments) {
        var message = arguments["statusMessage"]
        
        if (message) {
            alert(message);
        }
    }
}

var ExtensionPreprocessingJS = new Action
