function toggleBrowse() {
    const browse = document.getElementById('mainsection');
    const favorites = document.getElementById('favorites');
    const about_us = document.getElementById('about_us');

    if (browse.style.display !== 'block') {
      browse.style.display = 'block';
      about_us.style.display = 'none';
      favorites.style.display = 'none';
  }
  }
  

  function toggleFavorites() {
    const browse = document.getElementById('browse');
    const favorites = document.getElementById('favorites');
    const about_us = document.getElementById('about_us');
    const mainsection = document.getElementById('mainsection');
    
    // Hide the about info if it's visible
    if (favorites.style.display !== 'flex') {
      favorites.style.display = 'flex';
      browse.style.display = 'none';
      about_us.style.display = 'none';
      mainsection.style.display = 'none';
  }
  }

  function toggleAboutUs() {
    const browse = document.getElementById('browse');
    const favorites = document.getElementById('favorites');
    const about_us = document.getElementById('about_us');
    const mainsection = document.getElementById('mainsection');
    
    if (about_us.style.display !== 'flex') {
      about_us.style.display = 'flex';
      browse.style.display = 'none';
      favorites.style.display = 'none';
      mainsection.style.display = 'none';
  }
  }