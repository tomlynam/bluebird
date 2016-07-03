$(document).ready( function() {
	$('#tweet_button').on('click', function() {
		var tweet = $('#tweet').val();
		$.ajax({
			url: '/tweets',
			type: 'POST',
			data: { tweet: tweet }
		}).done( function(tweet) {
			$('#tweets').append('<li>' + tweet.text + '</li>')
		});
	})
});