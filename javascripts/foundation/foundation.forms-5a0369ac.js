!function(s,t,e,i){"use strict";Foundation.libs.forms={name:"forms",version:"4.0.4",settings:{disable_class:"no-custom"},init:function(t,e,i){return this.scope=t||this.scope,"object"==typeof e&&s.extend(!0,this.settings,e),"string"!=typeof e?(this.settings.init||this.events(),this.assemble(),this.settings.init):this[e].call(this,i)},assemble:function(){s('form.custom input[type="radio"]',s(this.scope)).not('[data-customforms="disabled"]').each(this.append_custom_markup),s('form.custom input[type="checkbox"]',s(this.scope)).not('[data-customforms="disabled"]').each(this.append_custom_markup),s("form.custom select",s(this.scope)).not('[data-customforms="disabled"]').each(this.append_custom_select)},events:function(){var t=this;s(this.scope).on("change.fndtn.forms",'form.custom select:not([data-customforms="disabled"])',function(){t.refresh_custom_select(s(this))}).on("click.fndtn.forms","form.custom label",function(e){var i,n,o=s("#"+t.escape(s(this).attr("for"))+':not([data-customforms="disabled"])');0!==o.length&&("checkbox"===o.attr("type")?(e.preventDefault(),i=s(this).find("span.custom.checkbox"),0==i.length&&(i=s(this).siblings("span.custom.checkbox").first()),t.toggle_checkbox(i)):"radio"===o.attr("type")&&(e.preventDefault(),n=s(this).find("span.custom.radio"),0==n.length&&(n=s(this).siblings("span.custom.radio").first()),t.toggle_radio(n)))}).on("click.fndtn.forms","form.custom div.custom.dropdown a.current, form.custom div.custom.dropdown a.selector",function(e){var i=s(this),n=i.closest("div.custom.dropdown"),o=n.prev();return n.hasClass("open")||s(t.scope).trigger("click"),e.preventDefault(),!1===o.is(":disabled")?(n.toggleClass("open"),n.hasClass("open")?s(t.scope).on("click.fndtn.forms.customdropdown",function(){n.removeClass("open"),s(t.scope).off(".fndtn.forms.customdropdown")}):s(t.scope).on(".fndtn.forms.customdropdown"),!1):void 0}).on("click.fndtn.forms touchend.fndtn.forms","form.custom div.custom.dropdown li",function(t){var e=s(this),i=e.closest("div.custom.dropdown"),n=i.prev(),o=0;if(t.preventDefault(),t.stopPropagation(),!s(this).hasClass("disabled")){s("div.dropdown").not(i).removeClass("open");var d=e.closest("ul").find("li.selected");d.removeClass("selected"),e.addClass("selected"),i.removeClass("open").find("a.current").html(e.html()),e.closest("ul").find("li").each(function(s){e[0]==this&&(o=s)}),n[0].selectedIndex=o,n.data("prevalue",d.html()),n.trigger("change")}}),this.settings.init=!0},append_custom_markup:function(t,e){var i=s(e).hide(),n=i.attr("type"),o=i.next("span.custom."+n);0===o.length&&(o=s('<span class="custom '+n+'"></span>').insertAfter(i)),o.toggleClass("checked",i.is(":checked")),o.toggleClass("disabled",i.is(":disabled"))},append_custom_select:function(t,e){var i,n=Foundation.libs.forms,o=s(e),d=o.next("div.custom.dropdown"),a=d.find("ul"),c=(d.find(".current"),d.find(".selector")),l=o.find("option"),r=l.filter(":selected"),h=o.attr("class")?o.attr("class").split(" "):[],f=0,u="",m=!1;if(!o.hasClass(n.settings.disable_class)){if(0===d.length){var p=o.hasClass("small")?"small":o.hasClass("medium")?"medium":o.hasClass("large")?"large":o.hasClass("expand")?"expand":"";d=s('<div class="'+["custom","dropdown",p].concat(h).filter(function(s,t,e){return""==s?!1:e.indexOf(s)==t}).join(" ")+'"><a href="#" class="selector"></a><ul /></div>'),c=d.find(".selector"),a=d.find("ul"),u=l.map(function(){return"<li>"+s(this).html()+"</li>"}).get().join(""),a.append(u),m=d.prepend('<a href="#" class="current">'+r.html()+"</a>").find(".current"),o.after(d).hide()}else u=l.map(function(){return"<li>"+s(this).html()+"</li>"}).get().join(""),a.html("").append(u);if(d.toggleClass("disabled",o.is(":disabled")),i=a.find("li"),l.each(function(t){this.selected&&(i.eq(t).addClass("selected"),m&&m.html(s(this).html())),s(this).is(":disabled")&&i.eq(t).addClass("disabled")}),!d.is(".small, .medium, .large, .expand")){d.addClass("open");var n=Foundation.libs.forms;n.hidden_fix.adjust(a),f=n.outerWidth(i)>f?n.outerWidth(i):f,Foundation.libs.forms.hidden_fix.reset(),d.removeClass("open")}}},refresh_custom_select:function(t){var e=this,i=0,n=t.next(),o=t.find("option");n.find("ul").html(""),o.each(function(){var t=s("<li>"+s(this).html()+"</li>");n.find("ul").append(t)}),o.each(function(t){this.selected&&(n.find("li").eq(t).addClass("selected"),n.find(".current").html(s(this).html())),s(this).is(":disabled")&&n.find("li").eq(t).addClass("disabled")}),n.removeAttr("style").find("ul").removeAttr("style"),n.find("li").each(function(){n.addClass("open"),e.outerWidth(s(this))>i&&(i=e.outerWidth(s(this))),n.removeClass("open")})},toggle_checkbox:function(s){var t=s.prev(),e=t[0];!1===t.is(":disabled")&&(e.checked=e.checked?!1:!0,s.toggleClass("checked"),t.trigger("change"))},toggle_radio:function(s){var t=s.prev(),e=t.closest("form.custom"),i=t[0];!1===t.is(":disabled")&&(e.find('input[type="radio"][name="'+this.escape(t.attr("name"))+'"]').next().not(s).removeClass("checked"),s.hasClass("checked")||s.toggleClass("checked"),i.checked=s.hasClass("checked"),t.trigger("change"))},escape:function(s){return s.replace(/[-[\]{}()*+?.,\\^$|#\s]/g,"\\$&")},hidden_fix:{tmp:[],hidden:null,adjust:function(t){var e=this;e.hidden=t.parents().andSelf().filter(":hidden"),e.hidden.each(function(){var t=s(this);e.tmp.push(t.attr("style")),t.css({visibility:"hidden",display:"block"})})},reset:function(){var t=this;t.hidden.each(function(e){var n=s(this),o=t.tmp[e];o===i?n.removeAttr("style"):n.attr("style",o)}),t.tmp=[],t.hidden=null}},off:function(){s(this.scope).off(".fndtn.forms")}}}(Foundation.zj,this,this.document);