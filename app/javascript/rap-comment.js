function form(){
  const btn = document.getElementById('rap-btn')
  const rap_comment = document.getElementById('horse-show-commentbox')
  btn.addEventListener('click',()=>{
    if (rap_comment.getAttribute('style') == "display:block;"){
      rap_comment.removeAttribute('style',"display:block;")
     }
  else {rap_comment.setAttribute('style',"display:block;")}
  })

}

window.addEventListener('load',form)