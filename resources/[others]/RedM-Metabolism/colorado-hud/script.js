window.addEventListener('message', function(event) {
  if(event.data.action === 'showHudContent'){
    return showHudContent()
  }
  if(event.data.action === 'hideHudContent'){
    return hideHudContent()
  }
  if(event.data.action === 'setStress'){
    return setStress(event.data.stress)
  }
  if(event.data.action === 'setFood2'){
    return setFood(event.data.food)
  }
  if(event.data.action === 'setWater'){
    return setWater(event.data.water)
  }
  if(event.data.action === 'setHealth'){
    return setHealth(event.data.health)
  }
  if(event.data.action === 'setStamina'){
    return setStamina(event.data.stamina)
  }
  if(event.data.action === 'showAlert'){
    return showAlert(event.data.alertType,event.data.alertMessage)
  }
  if(event.data.action === 'showNotification'){
    return showNotification(event.data.alertType,event.data.alertMessage,event.data.alertUsername)
  }
  if(event.data.action === 'openMic'){
    return openMic()
  }
  if(event.data.action === 'closeMic'){
    return closeMic()
  }
  if(event.data.action === 'changeMic'){
    return changeMic(event.data.newState)
  }
  if(event.data.action === 'changeTemperature'){
    return changeTemperature(event.data.newState)
  }
  if(event.data.action === 'changeHour'){
    return changeHour(event.data.newState)
  }
});


function showNotification(alertType, alertMessage, name) {
  var css = '';
  var typeOfAlert = '';
  var image = '';
  var divName = ``;
  if (name) {
    divName = `<div class="name" id="name">${name}</div>`;
  }
  if (alertType == 'medic') {
    css = `medic`;
    typeOfAlert = 'Pombo dos Médicos';
    image = 'images/medic.png';
  } else if (alertType == 'medic-player') {
    css = `medic-player`;
    typeOfAlert = 'Pombo de Ajuda';
    image = 'images/medic.png';
  } else if (alertType == 'complaint') {
    css = `complaint`;
    typeOfAlert = 'Pombo da Cavalaria';
    image = 'images/sheriff-badge.png';
  }
  var html = `
    <div class="background ${css}">
    <div class="image">
        <img id="image" width="65px" height="65px" src="${image}">
    </div>
    <div class="container">
        <div class="typeOfAlert">${typeOfAlert}</div>
        <div class="message">${alertMessage}</div>
        ${divName}
    </div>
  </div>
  `;
  $(html).prependTo("#notifications").hide().fadeIn(1000).css("display","flex").delay(12000).fadeOut(1000);
}

/*
  SendNUIMessage({ 
    action = 'changeMic', 
    newState = 'Susurrando'
  })
  SendNUIMessage({ 
    action = 'changeTemperature', 
    newState = '20ºC'
  })
  SendNUIMessage({ 
    action = 'changeHour', 
    newState = '20:20'
  })
   SendNUIMessage({ 
    action = 'showHudContent'
  })
*/

function showHudContent(){
  const body = document.querySelector('body')
  body.style.opacity = 1;
}
function hideHudContent(){
  const body = document.querySelector('body')
  body.style.opacity = 0;
}

const changeMic = (newState) => changeHeaderItem({type: 'mic', newValue: newState})
const changeTemperature = (newState) => changeHeaderItem({type: 'temperature', newValue: newState})
const changeHour = (newState) => changeHeaderItem({type: 'clock', newValue: newState})

function changeHeaderItem({type, newValue}) {
  const textElement = document.querySelector(`#${type} span`)
  textElement.innerText = newValue
}

/*
  SendNUIMessage({ 
    action = 'openMic'
  })
*/

function openMic(){
  const imageElement = document.querySelector('#mic img')
  imageElement.src = imageElement.src.replace('mic.png', 'micred.png')
  const textElement = document.querySelector('#mic span')
}

/*
  SendNUIMessage({ 
    action = 'closeMic'
  })
*/

function closeMic(){
  const imageElement = document.querySelector('#mic img')
  imageElement.src = imageElement.src.replace('micred.png', 'mic.png')
  const textElement = document.querySelector('#mic span')
}

/*
Vamos precisar setar um comando em lua para chamar essa função do JS

  SendNUIMessage({ 
    action = 'showAlert', 
    alert = {type: 'notify', message: 'teste'}
  })

  seria algo mais ou menos como mostrado acima.
*/

function showAlert(alertType, alertMessage){
  const element = document.getElementsByClassName(`alert ${alertType}`)
  element[0].style.opacity = 1;

  const elementP = document.querySelector(`.${alertType} > p`)
  if(alertMessage){
    elementP.innerText = alertMessage;
  }else{
    elementP.innerText = "";
  }

  setTimeout(()=>{
    element[0].style.opacity = 0;
  }, 7000)
}

function updateProgressBar({limitInPercent, elementId, valueInPercent}){
  const totalHeight = document.getElementById(`${elementId}-base`).clientHeight

  const newHeight = (totalHeight / 100) * valueInPercent

  if(valueInPercent < limitInPercent){
    document.getElementById(`${elementId}-red`).style.height = newHeight;
    document.getElementById(`${elementId}-white`).style.height = 0;
  }else{
    document.getElementById(`${elementId}-white`).style.height = newHeight;
    document.getElementById(`${elementId}-red`).style.height = 0;
  }
}

function setStress(valueInPercent) {
  updateProgressBar({
    elementId: 'stress',
    limitInPercent: 101,
    valueInPercent: valueInPercent
  })
}

function setFood(valueInPercent) {
  updateProgressBar({
    elementId: 'food',
    limitInPercent: 30,
    valueInPercent: valueInPercent
  })
}

function setWater(valueInPercent) {
  updateProgressBar({
    elementId: 'water',
    limitInPercent: 30,
    valueInPercent: valueInPercent
  })
}

function setHealth(valueInPercent) {
  updateProgressBar({
    elementId: 'health',
    limitInPercent: 30,
    valueInPercent: valueInPercent
  })
}

function setStamina(valueInPercent) {
  updateProgressBar({
    elementId: 'stamina',
    limitInPercent: 30,
    valueInPercent: valueInPercent
  })
}