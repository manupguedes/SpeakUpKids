//----------------------------------------------------------------------------------------
//--------------------------Mostrar Senha Login------------------
function mostrarOcultarSenha() {
    var senha = document.getElementById("senha");
    if (senha.type === "password") {
        senha.type = "text";
    } else {
        senha.type = "password";
    }
}



function mostrarOcultarSenha2() {
    var senha = document.getElementById("confirmarSenha");
    if (senha.type === "password") {
        senha.type = "text";
    } else {
        senha.type = "password";
    }
}



//----------------------------------------------------------------------------------------
//--------------------------Professor Adicionar Imagem Conteudo------------------

document.addEventListener("DOMContentLoaded", function () {
    const fileInput = document.getElementById("fileInput");
    const imagePreview = document.getElementById("imagePreview");
    const placeholderText = document.getElementById("placeholderText");

    fileInput.addEventListener("change", function (event) {
        const selectedFile = event.target.files[0];

        if (selectedFile) {
            const reader = new FileReader();

            reader.onload = function (event) {
                imagePreview.style.display = "block";
                imagePreview.src = event.target.result;
                placeholderText.style.display = "none";
            };

            reader.readAsDataURL(selectedFile);
        } else {
            imagePreview.style.display = "none";
            placeholderText.style.display = "block";
            imagePreview.src = "#";
        }
    });
});


//----------------------------------------------------------------------------------------
//--------------------------Professor Lista Exercicios------------------

//--------------------------Adicionar Questao---------------------------

const op1Checkbox = document.getElementById("dissertativa");
const op2Checkbox = document.getElementById("alternativa");

// Evento change para alternar entre Op1 e Op2
function alternarOpcoes(event) {
    if (event.target === op1Checkbox && op1Checkbox.checked) {
        op2Checkbox.checked = false;
    } else if (event.target === op2Checkbox && op2Checkbox.checked) {
        op1Checkbox.checked = false;
    }
}

op1Checkbox.addEventListener("change", alternarOpcoes);
op2Checkbox.addEventListener("change", alternarOpcoes);

//--------------------------------------------------------------------------

const dissertativaCheckbox = document.getElementById("dissertativa");
const alternativaCheckbox = document.getElementById("alternativa");
const respostaDissertativa = document.getElementById("respostaDissertativa");
const alternativaDiv = document.querySelector(".alternativa");

// Evento change para alternar entre Dissertativa e Alternativa
function alternarModo() {
    if (dissertativaCheckbox.checked) {
        respostaDissertativa.style.display = "block";
        alternativaDiv.style.display = "none";
        alternativaCheckbox.checked = false;
    } else if (alternativaCheckbox.checked) {
        respostaDissertativa.style.display = "none";
        alternativaDiv.style.display = "block";
        dissertativaCheckbox.checked = false;
    }
}

dissertativaCheckbox.addEventListener("change", alternarModo);
alternativaCheckbox.addEventListener("change", alternarModo);

// Ao carregar a página, garantir que apenas o checkbox "Dissertativa" esteja marcado e a alternativa esteja ocultada
window.onload = function () {
    alternativaCheckbox.checked = false;
    alternativaDiv.style.display = "none";
    dissertativaCheckbox.checked = true;
    respostaDissertativa.style.display = "block";
};

//---------------------------------------------------------------------------
