$(function() {
  $("a.all_comments").on("click", function(e){
    $.ajax({
      method: "GET",
      url: `${this.href}.json`
    }).done(function(response){
      const result = response.filter(resp => resp.body.length > 4)

      $("div.comments").html(result.map(resp => {
        return `<p><strong> ${resp.user.username} </strong>: ${resp.body} </p>`
      }))
    })
    e.preventDefault();
   })
});

$(function() {
  $("a.show_genre").on("click", function(e){
    $.ajax({
     method: "GET",
     url: `${this.href}.json`
    }).done(function(response){
      $("div.show_movies").html(response.movies.map(resp => {
        return `<h3><strong> ${resp.title} </strong></h3>
                <p> by ${resp.director}</p>
                <a href="moviess/${resp.id}">View movie</a>`
      }))
    })
    e.preventDefault();
  })
});

function Comment(json) {
  this.id = json.id
  this.body = json.body
  
}
 Comment.prototype.renderP = function() {
   return "<p>" + this.body + "</p>"
}
 $(function() {
  $("form#new_comment").on("submit", function(e) {
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();
     $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
      })
      .done(function(json) {
       var comment = new Comment(json)
       var commentP = comment.renderP()
       $(".new").append(commentP)
     })
    .error(function(response) {
      console.log("error!", response)
    })
  })
})




