// For 
function BlockBar() {
    var alertBar = document.querySelector('.alertbar');
    if (alertBar) {
        alertBar.style.display = 'none';
    }
}
// for Profile Picture Chooser

const imgDiv = document.querySelector('profile-pic-div');
const img = document.querySelector('#previewPhoto');
const file = document.querySelector('#file');
const uploadBtn = document.querySelector('#uploadBtn');

file.addEventListener('change', function () {
    const choosedFile = this.files[0];
    if (choosedFile) {
        const reader = new FileReader();

        reader.addEventListener('load', function
            () {
            img.setAttribute('src', reader.result);
        });
        reader.readAsDataURL(choosedFile);
    }
});

function toggleThumbsUp() {
    var thumbsUpIcon = document.getElementById('thumbsUpIcon');
    thumbsUpIcon.classList.toggle('active'); // Toggle the 'active' class
  }

  function toggleBookmark() {
    var bookmarkIcon = document.getElementById('bookmarkIcon');
    bookmarkIcon.classList.toggle('active'); // Toggle the 'active' class
  }

//   for Profile Picture 

document.addEventListener('click', function(event) {
    var dropdownContent = document.getElementById("dropdownContent");
    if (!dropdownContent.contains(event.target)) {
      dropdownContent.classList.remove("show");
    }
  });
  
  function toggleDropdown(event) {
    var dropdownContent = document.getElementById("dropdownContent");
    dropdownContent.classList.toggle("show");
    event.stopPropagation(); // Stop the click event from propagating further
  }
  // Update Profile
  document.addEventListener('click', function(event) {
    var dropdownContent = document.getElementById("dropContent");
    if (!dropdownContent.contains(event.target)) {
      dropdownContent.classList.remove("show");
    }
  });
  
  function togglDropdown(event) {
    var dropdownContent = document.getElementById("dropContent");
    dropdownContent.classList.toggle("show");
    event.stopPropagation(); // Stop the click event from propagating further
  }


