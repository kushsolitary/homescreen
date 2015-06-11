# For iPhone 5/5s
Framer.Device.contentScale = 0.692

Framer.Device.deviceType = "iphone-6-silver"

# Variables
background1 = new Layer
	x:0, y:0, width:1080, height:1775, image:"images/background1.png"

background2 = new Layer
	x:100, y:0, width:1080, height:1775, image:"images/background2.png"
	opacity: 0

gradBg = new Layer
	x:0, y:0, width:1100, height:2509, image:"images/gradBg.png"

statusBar = new Layer
	x:20, y:0, width:1040, height:52, image:"images/statusbar.png"

logoTop = new Layer
	x:1080/2 - 420/2, y:228, width: 420, height: 73.5, image:"images/logoTop.png"

account = new Layer
	x:840, y:120, width:72, height:72, image:"images/account.png", visible: false

dots = new Layer
	x:991, y:130, width:12, height:54, image:"images/dots.png", visible: false

topSearchBg = new Layer
	x: 0, y: 72, width: 1080, height: 263, opacity: 0, backgroundColor: "rgba(255, 255, 255, 0)"
	shadowY: 2, shadowBlur: 10, shadowColor: "rgba(0, 0, 0, 0.2)"

searchBar = new Layer
	x:48, y:600, width:984, height:168, image:"images/searchBar.png"
	shadowY: 2, shadowBlur: 10, shadowColor: "rgba(0, 0, 0, 0.2)"

btnAlerts = new Layer
	x:563, y:1345, width:468, height:144, image:"images/btnAlerts.png"

btnShortlist = new Layer
	x:48, y:1345, width:469, height:144, image:"images/btnShortlist.png"

btnShortlist2 = new Layer
	x:1128, y:1345, width:469, height:144, image:"images/btnShortlist.png"

btnAlerts2 = new Layer
	x:1643, y:1345, width:468, height:144, image:"images/btnAlerts.png"

card3 = new Layer
	x:48, y:1540, width:985, height:504, image:"images/card_3.png"
	scale: 0.90, shadowY: 0, shadowBlur: 10, shadowColor: "rgba(0, 0, 0, 0.2)"

card2 = new Layer
	x:48, y:1570, width:985, height:526, image:"images/card_2.png"
	scale: 0.95, shadowY: 0, shadowBlur: 20, shadowColor: "rgba(0, 0, 0, 0.2)"

card1 = new Layer
	x:48, y:1604, width:986, height:526, image:"images/card_1.png"
	shadowY: 0, shadowBlur: 15, shadowColor: "rgba(0, 0, 0, 0.2)"

# Objects on the second screen
card6 = new Layer
	x:1128, y:1540, width:985, height:504, image:"images/card_3.png"
	scale: 0.90, shadowY: 0, shadowBlur: 10, shadowColor: "rgba(0, 0, 0, 0.2)"

card5 = new Layer
	x:1128, y:1570, width:985, height:526, image:"images/card_2.png"
	scale: 0.95, shadowY: 0, shadowBlur: 20, shadowColor: "rgba(0, 0, 0, 0.2)"

card4 = new Layer
	x:1128, y:1604, width:986, height:526, image:"images/card_1.png"
	shadowY: 0, shadowBlur: 15, shadowColor: "rgba(0, 0, 0, 0.2)"

# /
navBar = new Layer
	x:0, y:1710, width:1080, height:220, image:"images/tabbar.png"

sections = new Layer
	x: 0, y: 510, width: 1300, height: 54, backgroundColor: "transparent"

sections.html = "<span style='margin: 0 48px'>BUY</span><span style='margin: 0 48px; opacity: 0.6'>RENT</span><span style='margin: 0 48px; opacity: 0.6'>PG/HOSTELS</span><span style='margin: 0 48px; opacity: 0.6'>AGENTS</span>"
sections.style.color = "white"
sections.style.fontFamily = "HelveticaNeue"
sections.style.fontSize = "48px"
sections.style.fontWeight = "600"
sections.style.paddingTop = "6px"

# Settings
areCardsOpen = false
isSecondScreen = false
Framer.Defaults.Animation.curve = "spring(250,30,0)"


# Add final states to objects
btnAlerts.states.add
	hide: {opacity: 0, y: 250}
	slide: {x: -659}

gradBg.states.add
	darken: {y: -589}

btnShortlist.states.add
	hide: {opacity: 0, y: 250}
	slide: {x: -1128}

btnAlerts2.states.add
	hide: {opacity: 0, y: 250}
	slide: {x: 563}

btnShortlist2.states.add
	hide: {opacity: 0, y: 250}
	slide: {x: 48}

logoTop.states.add
	hide: {opacity: 0, y: 108}

account.states.add
	hide: {opacity: 0, y: 100}

dots.states.add
	hide: {opacity: 0, y: 110}

searchBar.states.add
	active: {y: 121}

sections.states.add
	hide: {opacity: 0, y: 121}
	slide: {x: -192}

topSearchBg.states.add
	show: {opacity: 1}

card1.states.add
	open: {y: 382}
	slide: {x: -1128}

card2.states.add
	open: {y: 382 + card1.height + 48, scale: 1}
	slide: {x: -1128}

card3.states.add
	open: {y: (382 + card2.height + card1.height + (48 * 2)), scale: 1}
	slide: {x: -1128}

card4.states.add
	slide: {x: 48}

card5.states.add
	slide: {x: 48}

card6.states.add
	slide: {x: 48}

background1.states.add
	slide: {x: -100, opacity: 0}

background2.states.add
	slide: {x: 0, opacity: 1}

# Cards animation
card1.on Events.TouchEnd, ->
	sections.states.next("default", "hide")
	searchBar.states.next("default", "active")
	topSearchBg.states.next("default", "show")
	btnAlerts.states.next("default", "hide")
	account.states.next("default", "hide")
	dots.states.next("default", "hide")
	logoTop.states.next("default", "hide")
	btnShortlist.states.next("default", "hide")
	gradBg.states.next("default", "darken")

	# Move cards
	card1.states.next("default", "open")
	Utils.delay 0.05, ->
		card2.states.next("default", "open")
	Utils.delay 0.1, ->
		card3.states.next("default", "open")

	areCardsOpen = !areCardsOpen

# Section switching animation
gradBg.on Events.TouchEnd, ->
	if areCardsOpen then return

	btnAlerts2.states.next("default", "slide")
	btnShortlist2.states.next("default", "slide")
	btnAlerts.states.next("default", "slide")
	btnShortlist.states.next("default", "slide")
	sections.states.next("default", "slide")
	card1.states.next("default", "slide")
	card2.states.next("default", "slide")
	card3.states.next("default", "slide")

	card4.states.next("default", "slide")
	card5.states.next("default", "slide")
	card6.states.next("default", "slide")

	background1.states.next("default", "slide")
	background2.states.next("default", "slide")

	if isSecondScreen
		sections.html = "<span style='margin: 0 48px'>BUY</span><span style='margin: 0 48px; opacity: 0.6'>RENT</span><span style='margin: 0 48px; opacity: 0.6'>PG/HOSTELS</span><span style='margin: 0 48px; opacity: 0.6'>AGENTS</span>"
	else
		sections.html = "<span style='margin: 0 48px; opacity: 0.6'>BUY</span><span style='margin: 0 48px'>RENT</span><span style='margin: 0 48px; opacity: 0.6'>PG/HOSTELS</span><span style='margin: 0 48px; opacity: 0.6'>AGENTS</span>"

	isSecondScreen = !isSecondScreen


