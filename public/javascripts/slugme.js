(function($){
	
	$.fn.extend({
		
		slugme: function( output ) {
			
			var slug = function(string) {
				return string.toLowerCase().replace(/'/g,"").replace(/&/g,'and').replace(/[^0-9a-z]+/g,' ').replace(/\s/g,'-').replace(/-$/,'');
			}
			
			var output = $(output);
			    output.attr('readonly', true);	
			
			return this.each(function(){
				
				var input = $(this);
				var edit = $("<a>", { 
					href: '#',
					html: 'edit' 
				}).click(function(){
					output.removeAttr('readonly');
					output.focus();
				});
				
				output.after( edit );
				output.focusout(function(){
					output.attr('readonly', true);
				});
				
				input.on('keyup', function() {
					output.val( slug(input.val()) );		
				});
				
			});
		}
		
	});
	
	
})(jQuery);