function form(){
  const btn = document.getElementById('subform-btn')
  const subform = document.getElementById('race-form-sub')
  btn.addEventListener('click',()=>{
    if (subform.getAttribute('style') == "display:block;"){
      subform.removeAttribute('style',"display:block;")
     }
  else {subform.setAttribute('style',"display:block;")}
  })

}

window.addEventListener('load',form)