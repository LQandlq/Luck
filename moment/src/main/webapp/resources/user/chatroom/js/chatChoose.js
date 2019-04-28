//document.querySelector('.chat[data-chat=person2]').classList.add('active-chat');
//document.querySelector('.person[data-chat=person2]').classList.add('active');

var friends = {
  list: document.querySelector('ul.people'),
  all: document.querySelectorAll('.left .person'),
  name: '' },

chat = {
  container: document.querySelector('.container .right'),
  current: null,
  person: null,
  name: document.querySelector('.container .right .top .name') };


friends.all.forEach(function (f) {
  f.addEventListener('mousedown', function () {
    f.classList.contains('active') || setAciveChat(f);
  });
});

function setAciveChat(f) {
	 $('li').removeClass("active");
  //friends.list.querySelector('.active').classList.remove('active');
  f.classList.add('active');
  chat.current = chat.container.querySelector('.active-chat');
  chat.person = f.getAttribute('data-chat');
  $('div').removeClass("active-chat");
  //chat.current.classList.remove('active-chat');
  console.log("js:"+$('div[data-chat="' + chat.person + '"]').addClass("active-chat"));
  $('[data-chat="' + chat.person + '"]')
  //chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat');
  friends.name = f.querySelector('.name').innerText;
  //更换聊天标题
 $('.nameTop').text($('li[data-chat='+chat.person+']').find('span.name').text());
  //console.log("asd:"+ $('li[data-chat='+chat.person+']').find('span.name').text());
  //chat.name.innerHTML = friends.name;
}