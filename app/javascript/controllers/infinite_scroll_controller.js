// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["entries", "pagination"]

  scroll() {
    let url = this.paginationTarget.querySelector("a[rel='next']").href
    // console.log(window.pageYOffset)
    var body = document.body,
      html = document.documentElement

    var height = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.offsetHeight)

    if (window.pageYOffset >= height - window.innerHeight - 100) {
      this.loadMore(url)
    }
  }

  loadMore(url) {
    Rails.ajax({
      type: 'GET',
      url: url,
      dataType: 'json',
      success: (data) => {
        console.log(data)
      }
    })
  }
}
