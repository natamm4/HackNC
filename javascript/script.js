  
  function submitLogin() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
  
    alert(`Username: ${username}\nPassword: ${password}`);
  }

  function toggleLoginForm() {
    const loginForm = document.getElementById('loginForm');
    const aboutInfo = document.getElementById('aboutinfo');
    

    aboutInfo.style.display = 'none';
    

    loginForm.style.display = loginForm.style.display === 'flex' ? 'none' : 'flex';
  }
  
  function toggleAboutInfo() {
    const aboutInfo = document.getElementById('aboutinfo');
    const loginForm = document.getElementById('loginForm');
    
 
    loginForm.style.display = 'none';
    
   
    aboutInfo.style.display = aboutInfo.style.display === 'block' ? 'none' : 'block';
  }

  //chatgpt used for java script help