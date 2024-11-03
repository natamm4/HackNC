// Global variables to store meal data
let mealCards = [];
let filteredCards = [];
let activeFilters = {
    diet: [],
    vendor: []
};

// Wait for DOM to load before running any code
document.addEventListener('DOMContentLoaded', () => {
    // Fetch and load the JSON data
    fetch('../meal-cards.json')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            mealCards = data;
            filteredCards = [...mealCards];
            displayMealCards(filteredCards);
        })
        .catch(error => {
            console.error('Error loading meal cards:', error);
        });
});

function displayMealCards(cards) {
    const container = document.getElementById('meal-cards-container');
    if (!container) {
        console.error('Container not found');
        return;
    }
    
    container.innerHTML = '';
    
    cards.forEach(card => {
        const cardElement = `
            <div class="card" data-id="${card.id}">
                <div class="card-image">
                    <img src="${card.image}" alt="${card.itemTitle}">
                </div>
                <div class="card-text">
                    <h3 class="card-title">${card.source}</h3>
                    <div class="content">
                        <p class="description">${card.itemTitle}</p>
                        <div class="price-distance">
                            <p>${card.price}</p>
                            <p>${card.distance}</p>
                        </div>
                        <p class="time">${card.pickupTime}</p>
                        <div class="filters">
                            ${card.dietaryRestrictions.map(restriction => 
                                `<span class="filter-tag">${restriction}</span>`
                            ).join('')}
                        </div>
                    </div>
                </div>
            </div>
        `;
        container.innerHTML += cardElement;
    });
}

function filterByDiet(restriction) {
    const index = activeFilters.diet.indexOf(restriction);
    if (index > -1) {
        activeFilters.diet.splice(index, 1); // Remove if exists
    } else {
        activeFilters.diet.push(restriction); // Add if doesn't exist
    }
    
    updateFilterButtons();
    applyFilters();
}

function filterByVendor(vendorType) {
    // Toggle filter by adding/removing from array
    const index = activeFilters.vendor.indexOf(vendorType);
    if (index > -1) {
        activeFilters.vendor.splice(index, 1); // Remove if exists
    } else {
        activeFilters.vendor.push(vendorType); // Add if doesn't exist
    }
    
    updateFilterButtons();
    applyFilters();
}

function applyFilters() {
    let filtered = [...mealCards];
    
    if (activeFilters.diet.length > 0) {
        filtered = filtered.filter(card => {
            return activeFilters.diet.every(diet => {
                switch(diet) {
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
        });
    }
    
    if (activeFilters.vendor.length > 0) {
        filtered = filtered.filter(card => 
            activeFilters.vendor.includes(card.vendorType)
        );
    }
    
    filteredCards = filtered;
    displayMealCards(filteredCards);
}

function updateFilterButtons() {
    // Remove active class from all buttons
    document.querySelectorAll('.filterButtonContainer button').forEach(button => {
        button.classList.remove('active');
    });
    
    // Add active class to all selected filters
    activeFilters.diet.forEach(diet => {
        document.querySelector(`button[onclick="filterByDiet('${diet}')"]`)?.classList.add('active');
    });
    
    activeFilters.vendor.forEach(vendor => {
        document.querySelector(`button[onclick="filterByVendor('${vendor}')"]`)?.classList.add('active');
    });
}

function clearFilters() {
    activeFilters = {
        diet: [],
        vendor: []
    };
    
    // Remove active class from all filter buttons
    document.querySelectorAll('.filterButtonContainer button').forEach(button => {
        button.classList.remove('active');
    });
    
    filteredCards = [...mealCards];
    displayMealCards(filteredCards);
}