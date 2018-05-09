# Инициализация

~~~js
new Vue({
  el: '',
  delimiters: ['${', '}']
});
~~~

# Следит за изменением данных

~~~js
watch: {
  varible: function (value, origin) {
    
  }
},
~~~

# Вызывает attachBehaviors после обновления dom

~~~js
updated: function () {
  Drupal.attachBehaviors(this.$el);
}
~~~

# Дополнить объект

~~~js
this.user = Object.assign({}, this.user, { a: 1, b: 2 })
~~~
