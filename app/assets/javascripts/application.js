//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .

$(function(){
  if ($('.messages.index').length > 0) {
    setInterval(function() {
      var jobId = $('.wrapper').data('jobId');
      var requestId = $('.wrapper').data('requestId');
      $.ajax({
        type: 'GET',
        url: '/jobs/' + jobId + '/requests/' + requestId + '/messages',
        success: function(response) {
          $('.messages-sent').html($(response).find('.messages-sent'));
          // debugger;
          // response.forEach(function(repo) {
          //   var content = $('.form-inputs').html(repo.content).text();
          //   var the_message = '<li>' + content +  '</li>';
          //   $('.unstyle').append(the_message);
          // });
        }
      });
    }, 3000);
  }
});
