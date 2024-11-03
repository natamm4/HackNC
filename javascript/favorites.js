function handleFavoriteClick(event) {
    const button = event.currentTarget;
    const card = button.closest('.card');

    if (card.closest('#favorites')) {
        
        card.remove();
        button.classList.remove('active');
        
        
        const favoritesSection = document.getElementById('favorites');
    } else {

        button.classList.toggle('active');

    }
}


document.querySelectorAll('.favorite-btn').forEach(button => {
    button.addEventListener('click', handleFavoriteClick);
});