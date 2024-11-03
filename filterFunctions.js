// Global variables to store meal data
let mealCards = [];
let filteredCards = [];
let activeFilters = {
    diet: null,
    vendor: null
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
    // Toggle filter if clicking the same button
    if (activeFilters.diet === restriction) {
        activeFilters.diet = null;
    } else {
        activeFilters.diet = restriction;
    }
    
    // Update button states
    updateFilterButtons();
    applyFilters();
}

function filterByVendor(vendorType) {
    // Toggle filter if clicking the same button
    if (activeFilters.vendor === vendorType) {
        activeFilters.vendor = null;
    } else {
        activeFilters.vendor = vendorType;
    }
    
    // Update button states
    updateFilterButtons();
    applyFilters();
}

function applyFilters() {
    let filtered = [...mealCards];
    
    if (activeFilters.diet) {
        filtered = filtered.filter(card => {
            switch(activeFilters.diet) {
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
    }
    
    if (activeFilters.vendor) {
        filtered = filtered.filter(card => card.vendorType === activeFilters.vendor);
    }
    
    filteredCards = filtered;
    displayMealCards(filteredCards);
}

function updateFilterButtons() {
    // Remove active class from all buttons
    document.querySelectorAll('.filterButtonContainer button').forEach(button => {
        button.classList.remove('active');
    });
    
    // Add active class to selected filters
    if (activeFilters.diet) {
        document.querySelector(`button[onclick="filterByDiet('${activeFilters.diet}')"]`)?.classList.add('active');
    }
    if (activeFilters.vendor) {
        document.querySelector(`button[onclick="filterByVendor('${activeFilters.vendor}')"]`)?.classList.add('active');
    }
}

function clearFilters() {
    activeFilters = {
        diet: null,
        vendor: null
    };
    
    // Remove active class from all filter buttons
    document.querySelectorAll('.filterButtonContainer button').forEach(button => {
        button.classList.remove('active');
    });
    
    filteredCards = [...mealCards];
    displayMealCards(filteredCards);
}