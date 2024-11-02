let mealCards = []; // JSON data
let filteredCards = []; // filtered results

// Fetch and load the JSON data
fetch('meal-cards.json')
    .then(response => response.json())
    .then(data => {
        mealCards = data;
        filteredCards = [...mealCards];
        displayMealCards(filteredCards);
    });

function displayMealCards(cards) {
    const container = document.getElementById('meal-cards-container');
    container.innerHTML = '';
    
    cards.forEach(card => {
        const cardElement = `
            <div class="meal-card">
                <img src="images/${card.image}" alt="${card.itemTitle}">
                <h3>${card.itemTitle}</h3>
                <p>${card.description}</p>
                <p>Price: ${card.price}</p>
                <p>Pickup: ${card.pickupTime}</p>
                <p>Distance: ${card.distance}</p>
            </div>
        `;
        container.innerHTML += cardElement;
    });
}

function filterByDiet(restriction) {
    filteredCards = mealCards.filter(card => {
        switch(restriction) {
            case 'Vegetarian':
                return card.isVegetarian;
            case 'Vegan':
                return card.isVegan;
            case 'Gluten-Free':
                return card.isGlutenFree;
            case 'Lactose-Free':
                return card.isLactoseFree;
            default:
                return true;
        }
    });
    displayMealCards(filteredCards);
}

function filterByVendor(vendorType) {
    filteredCards = mealCards.filter(card => card.vendorType === vendorType);
    displayMealCards(filteredCards);
}

function clearFilters() {
    filteredCards = [...mealCards];
    displayMealCards(filteredCards);
}