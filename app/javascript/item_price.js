window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue　* 0.1

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = inputValue - ( inputValue * 0.1 )
  })
});