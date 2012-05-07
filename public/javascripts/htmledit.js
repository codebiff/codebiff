(function($){
	
	
	
	$.fn.extend({
		
		htmlEdit: function(options) {
			
			var wrapText = function(element, openTag, closeTag) {
			    var textArea = element;
			    var len = textArea.val().length;
			    var start = textArea[0].selectionStart;
			    var end = textArea[0].selectionEnd;
			    var selectedText = textArea.val().substring(start, end);
			    var replacement = openTag + selectedText + closeTag;
			    textArea.val(textArea.val().substring(0, start) + replacement + textArea.val().substring(end, len));
			};

			var insertAtCaret = function(element, tag) {
				var textArea = element;
				var len = textArea.val().length;
			    var start = textArea[0].selectionStart;
			    var end = textArea[0].selectionEnd;
			    var selectedText = textArea.val().substring(start, end);
			    var replacement = tag;
			    textArea.val(textArea.val().substring(0, start) + replacement + textArea.val().substring(end, len));
			};

			var checkSelection = function(element) {
				var start = element[0].selectionStart;
				var end = element[0].selectionEnd;
				if (start != end) {	return true; }
				return false;
			};
			
			var defaults = {};
			var options = $.extend(defaults,options);
			
			return this.each(function(){
				
				var textarea = $(this);
			
				textarea.wrap('<div class="htmlEdit-container" />');
				textarea.before('<div class="htmlEdit-toolbar"><button data-tag="h1" title="Header 1">H1</button> <button data-tag="h2" title="Header 2">H2</button> <button data-tag="h3" title="Header 3">H3</button> <button data-tag="p" title="Paragraph">P</button> <button data-tag="strong" title="Bold">B</button> <button data-tag="em" title="Italic">i</button> <button data-tag="blockquote" title="Quote">quote</button> <button data-func="img" title="Image">img</button> <button data-func="link" title="Link">link</button> <button data-tag="code" title="code">code</button> <button data-tag="pre" title="pre">pre</button></div>');
				$('head').append('<style>.htmlEdit-container .htmlEdit-toolbar{font:normal 13px serif;margin:0 0 4px 2px;}.htmlEdit-container button{height:24px;background:#e8e8e8;border:1px solid #ccc;border-radius:4px;margin:0;}.htmlEdit-container button:hover{cursor:pointer;background:#fff;}.htmlEdit-container button[title="Header 1"],.htmlEdit-container button[title="Header 2"],.htmlEdit-container button[title="Header 3"],.htmlEdit-container button[title=Bold]{font-weight:700;}.htmlEdit-container button[title=Italic]{font-style:italic;}.htmlEdit-container button[title=Underline]{text-decoration:underline;}</style>');
				
				$(this).prev("div.htmlEdit-toolbar").children("button").click(function(event){
					
					event.preventDefault();
					
					var tag = $(this).data("tag");
					
					if (tag != undefined) {
						wrapText(textarea, "<"+tag+">", "</"+tag+">");
					} else {
						
					}
					
					switch( $(this).data("func") ) {
						
						case "img":
							var src = prompt("Please enter the image url");
							if (src) { insertAtCaret(textarea, '<img src="'+src+'" alt="" class=""/>'); }
							break;
						
						case "link":
							var href = prompt("Please enter link url");
							if (href) {
								if ( checkSelection(textarea) ) {
									wrapText(textarea, '<a href="'+href+'">', '</a>');
								} else {
									insertAtCaret(textarea, '<a href="'+href+'"></a>');
								}
							}	
							break;
					}

					textarea.focus();

				});
												
			});
		}
		
	});
	
})(jQuery);