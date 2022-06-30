import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="services"
export default class extends Controller {
  static targets = [ 'suppliers', 'quality' ]

  connect() {
  }

  show_suppliers_by_quality() {
    fetch('/api/qualities/' + this.qualityTarget.value + '/suppliers')
      .then(response => response.json())
      .then((data) => {
        this.suppliersTarget.innerHTML = ''
        data.forEach((supplier) => {
          const option = document.createElement('option')
          option.value = supplier.id
          option.innerHTML = supplier.name
          this.suppliersTarget.appendChild(option);
        });
      })
  }
}
