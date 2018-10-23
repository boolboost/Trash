# DOM Ready

~~~js
document.addEventListener('DOMContentLoaded', function() {

});
~~~

# DOM Query

~~~js
// tag
function $t(name, context) {
  return (context || document).getElementsByTagName(name);
}

// id
function $i(name) {
  return document.getElementById(name);
}

// class
function $c(name, context) {
  return (context || document).getElementsByClassName(name);
}

// single
function $1(selector, context) {
  return (context || document).querySelector(selector);
}

// all
function $$(selector, context) {
  return (context || document).querySelectorAll(selector);
}
~~~

# DOM Map
~~~js
// Foreach
els.forEach(function (item) {
  item.style.color = "green";
});

/**
 * CSS '> a'
 */
el.querySelector(':scope > a');
el.querySelectorAll(':scope > a');

/**
 * jQuery $(el).prev()
 */
function prev(el) {
  let previousSibling = el.previousSibling;

  while(previousSibling && previousSibling.nodeType != 1) {
    previousSibling = previousSibling.previousSibling;
  }
  
  return nextSibling;
}

/**
 * CSS '+ *'
 */
function next(el) {
  let nextSibling = el.nextSibling;

  while(nextSibling && nextSibling.nodeType != 1) {
    nextSibling = nextSibling.nextSibling;
  }
  
  return nextSibling;
}

/**
 * CSS '> :first-child'
 */
el.firstChild;

/**
 * CSS '> :last-child'
 */
el.lastChild;

/**
 * CSS '> *'
 */
let children = el.childNodes;

/**
 * jQuery $(el).parent()
 */
let parent = el.parentNode;

/**
 * jQuery $(el).closest()
 */
let closest = el.closest(selector));
~~~

# DOM data

~~~js
/**
 * jQuery $(el).text()
 */
let text = el.textContent;

/**
 * jQuery $(el).html()
 */
let html = el.innerHTML;

// Attr
el.attr;
delete el.attr;

// Data
el.getAttribute('data-foo');
el.setAttribute('data-foo', 'Hello World!');
el.removeAttribute('data-foo');

// Class

// hasClass
el.classList.contains(className);

// addClass
el.classList.add(className);

// removeClass
el.classList.remove(className);

// style
el.style.display = 'none';
el.style.cssText;

function setStyles(el, styles) {
  for (var property in styles)
  el.style[property] = styles[property];
}
~~~

# DOM Manipulation

~~~js
// Create
let el = document.createElement('div');
el.innerHTML = '<p>Hello World!</p>';
context.appendChild(el);

let textnode = document.createTextNode('Hello World!');
context.appendChild(textnode); 

// Clone
let clone = el.cloneNode(true);

// Empty
el.innerHTML = '';

// Remove
function remove(el) {
  el.parentNode.removeChild(el);
}

// Replace
function replace(el, newEl) {
  el.parentNode.replaceChild(newEl, el);
}

// Unwrap
function unwrap(el) {
  // get the element's parent node
  let parent = el.parentNode;

  // move all children out of the element
  while (el.firstChild) parent.insertBefore(el.firstChild, el);

  // remove the empty element
  parent.removeChild(el);
}

function wrap(el, wrap) {
  el.parentNode.insertBefore(wrap, el);
  wrap.appendChild(el);
}

function insertBefore(el, refEl) {
  refEl.parentNode.insertBefore(el, refEl);
}

function insertAfter(el, refEl) {
  refEl.parentNode.insertBefore(el, refEl.nextSibling);
}

// Append
context.appendChild(el);
~~~

# Events

~~~js
// stop the immediate action of this event
e.preventDefault();

// prevent the event fro bubbling up
e.stopPropagation();
~~~
