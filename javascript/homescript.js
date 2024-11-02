function toggleBrowse() {
    const browse = document.getElementById('browse');
    const favorites = document.getElementById('favorites');
    const about_us = document.getElementById('about_us');
    const mainsection = document.getElementById('mainsection');
    
    // Hide the about info if it's visible
    favorites.style.display = 'none';
    about_us.style.display = 'none';
    mainsection.style.display = 'none';
    
    // Toggle login form visibility
    browse.style.display = browse.style.display === 'flex' ? 'none' : 'flex';
  }
  

  function toggleFavorites() {
    const browse = document.getElementById('browse');
    const favorites = document.getElementById('favorites');
    const about_us = document.getElementById('about_us');
    const mainsection = document.getElementById('mainsection');
    
    // Hide the about info if it's visible
    browse.style.display = 'none';
    about_us.style.display = 'none';
    mainsection.style.display = 'none';
    
    // Toggle login form visibility
    favorites.style.display = favorites.style.display === 'flex' ? 'none' : 'flex';
  }

  function toggleAboutUs() {
    const browse = document.getElementById('browse');
    const favorites = document.getElementById('favorites');
    const about_us = document.getElementById('about_us');
    const mainsection = document.getElementById('mainsection');
    
    // Hide the about info if it's visible
    browse.style.display = 'none';
    favorites.style.display = 'none';
    mainsection.style.display = 'none';
    
    // Toggle login form visibility
    about_us.style.display = about_us.style.display === 'flex' ? 'none' : 'flex';
  }