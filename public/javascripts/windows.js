var Dialog = Class.create()

// TODO: Make this a proper singleton. Thankfully we are indempotent!
Dialog.instance = function() {
  return new Dialog()
}

Dialog.prototype = {
  initialize: function() {
    this.dialog = document.createElement('div')
  	this.dialog.setAttribute('id', 'dialog')
  
    this.overlay = document.createElement('div')
  	this.overlay.setAttribute('id', 'overlay')
  	this.overlay.style.display = 'none'
  	
  	Dialog._instance = this
  },
  
  open: function(options) {
    if (this.state == 'open') return
    this.state = 'open'
    
    if (options.title)   this.title   = options.title
    if (options.content) this.content = options.content

    this.applyOverlay()
    this.openDialog()
  },

  dismiss: function() {
    if (this.state == 'closed') return
    this.state = 'closed'
    
    this.dismissDialog()
    this.removeOverlay()
  },
  
  openDialog: function() {
  	getBody().appendChild(this.dialog)

    if (this.title) {
      title = document.createElement('span')
      title.setAttribute('id', 'dialog_title')
      title.setAttribute('class', 'title')
      title.innerHTML = this.title
  		this.dialog.appendChild(title)
  	}

  	content = document.createElement('div')
  	content.setAttribute('id', 'dialog_content')
  	content.setAttribute('class', 'content')
  	content.innerHTML = this.content
  	this.dialog.appendChild(content)
  },
  
  applyOverlay: function() {
    var pageSize = getPageSize()
    this.overlay.style.height = pageSize[1] + 'px'
  	getBody().appendChild(this.overlay)
  	new Effect.Appear('overlay', { duration: 0.2, from: 0.0, to: 0.8 })
  },
  
  dismissDialog: function() {
    new Effect.Puff('dialog', { afterFinish: function() { getBody().removeChild($('dialog')) } } )
  },
  
  removeOverlay: function() {
    Effect.Fade('overlay', { afterFinish: function() { getBody().removeChild($('overlay')) } } )
  }
}

function getBody() {
  return document.getElementsByTagName('body').item(0)
}

//
// getPageSize()
// Returns array with page width, height and window width, height
// Core code from - quirksmode.org
// Edit for Firefox by pHaez
//
function getPageSize() {
	var xScroll, yScroll;
	
	if (window.innerHeight && window.scrollMaxY) {	
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	}
	
	var windowWidth, windowHeight;
	if (self.innerHeight) {	// all except Explorer
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) { // other Explorers
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	}	
	
	// for small pages with total height less then height of the viewport
	if(yScroll < windowHeight){
		pageHeight = windowHeight;
	} else { 
		pageHeight = yScroll;
	}

	// for small pages with total width less then width of the viewport
	if(xScroll < windowWidth){	
		pageWidth = windowWidth;
	} else {
		pageWidth = xScroll;
	}

	arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight) 
	return arrayPageSize;
}
