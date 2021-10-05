//= require jquery.min
//= require bootstrap.min
//= require jquery3
//= require jquery_ujs
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../../assets/stylesheets/application.scss"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
