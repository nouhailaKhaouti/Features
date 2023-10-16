//------------------- Login & Signup Form -------------------//
//***********************************************************//

// Interior-box & Head Form Toggle link
const interior_box  = document.querySelector(".interior-box");      
const toggle_link   = document.querySelectorAll(".toggle");
// Form & Carousel change
toggle_link.forEach(link => {
    link.addEventListener("click", () => {
        interior_box.classList.toggle("login-mode");
    });
});

// Content Form Inputs-field
const inputs        = document.querySelectorAll(".input-field");
// Effet Inputs
inputs.forEach(inp => {
    inp.addEventListener("focus", () => {
        inp.classList.add("active-input");
    });
    inp.addEventListener("blur", () => {
        if(inp.value != "") return;
        inp.classList.remove("active-input");
    });
})


//------------------------ Carousel -------------------------//
//***********************************************************//

// Bullets Carousel & Images Carousel
const bullets       = document.querySelectorAll(".bullets span");
const image         = document.querySelectorAll(".imageC");

// Slider Move
function moveSlider(){
    // Images Move
    let index           = this.dataset.value;
    let currentImage    = document.querySelector(`.img-${index}`);
    image.forEach(img => img.classList.remove("show"));
    currentImage.classList.add("show")
    // Text Move
    const textSlide     = document.querySelector(".text-group");
    textSlide.style.transform = `translateY(${-(index - 1) * 2.2}rem)`
    // Bullets Move
    bullets.forEach(bull => bull.classList.remove("active"));
    this.classList.add("active");
}

bullets.forEach(bullet => {
    bullet.addEventListener("click", moveSlider);
});



