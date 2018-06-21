define(function(require, exports, module) {
"use strict";

var oop = require("../lib/oop");
var TextHighlightRules = require("./text_highlight_rules").TextHighlightRules;

var MyNewHighlightRules = function() {

    // regexp must not have capturing parentheses. Use (?:) instead.
    // regexps are ordered -> the first match is used
   this.$rules = {
        "start" : [
            {
                token: 'object', // String, Array, or Function: the CSS token to apply
                regex: /(<)/, // String or RegExp: the regexp to match
                next:  "construct-key"   // [Optional] String: next state to enter
            },
            {
                token: 'object',
                regex: /{/,
                next:  "selector"
            },
            {
                token: 'string',
                regex: /"[^"]*"/
            }

        ],

        "construct-key":[
            {
                token: 'identifier',
                regex: /\w+/
            },
            {
                token: 'colon',
                regex: /\:/,
                next: 'start'
            },
            {
                token: 'object',
                regex: /(>)/,
                next: 'start'
            }

        ],

        "construct-value":[
            {
                token: 'visor',
                regex: /(>)/,
                next: 'start'
            },

        ]
    };
};

oop.inherits(MyNewHighlightRules, TextHighlightRules);

exports.MyNewHighlightRules = MyNewHighlightRules;

});
