
// function Comment(json) {
//   this.body = json.body
// }

Comment.prototype.renderLI = function () {
	"<li>" + Comment + "</li>"
}
$(function () {
	$("form#new_comment").on("submit", function (e) {
		e.preventDefault;
		var $form = $(this);
		var action = $form.attr("action");
		var params = $form.serialize();

		$.ajax({
			url: action,
			data: params,
			dataType: "json",
			method: "POST"
		})
			.done(function (json) {

				var comment = new Comment(json)
				var commentLI = comment.renderLI()
				$(".comments").append(commentLI)
			})
			.error(function (response) {
				console.log("error!", response)
			})
	})
})