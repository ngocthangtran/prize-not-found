document.addEventListener('DOMContentLoaded', function() {
    const validationMessages = document.querySelectorAll('.validation-message');
    
    validationMessages.forEach(function(message) {
        const parent = message.closest('.password-wrapper');
        if (parent) {
            parent.classList.add('has-error');
        }
    });
    
    // Toggle senha
    const togglePassword = document.querySelector('.toggle-password');
    const passwordField = document.getElementById('password');
    
    if (togglePassword && passwordField) {
        togglePassword.addEventListener('click', function() {
            const icon = this.querySelector('i');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
    }
    
    // Efeitos de foco para campos de entrada
    const inputFields = document.querySelectorAll('.input-wrapper input');
    
    inputFields.forEach(function(input) {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
            
            if (this.value !== '') {
                this.parentElement.classList.add('has-value');
            } else {
                this.parentElement.classList.remove('has-value');
            }
        });
        
        if (input.value !== '') {
            input.parentElement.classList.add('has-value');
        }
    });
    
    const loginForm = document.getElementById('kc-form-login');
    
    if (loginForm) {
        loginForm.addEventListener('submit', function(event) {
            let hasError = false;
            
            // Obter os campos
            const usernameField = document.getElementById('username');
            const passwordField = document.getElementById('password');
            
            // Limpar erros anteriores
            document.querySelectorAll('.password-wrapper').forEach(function(wrapper) {
                wrapper.classList.remove('has-error');
            });
            
            document.querySelectorAll('.client-validation-message').forEach(function(message) {
                message.remove();
            });
            
            // Limpar bordas vermelhas anteriores
            usernameField.style.border = '';
            passwordField.style.border = '';
            
            // Validar username
            if (!usernameField.value.trim()) {
                createValidationMessage(usernameField, 'Tên đăng nhập không được để trống');
                usernameField.style.border = '1px solid red';
                hasError = true;
            }
            
            // Validar password
            if (!passwordField.value.trim()) {
                createValidationMessage(passwordField, 'Mật khẩu không được để trống');
                passwordField.style.border = '1px solid red';
                hasError = true;
            }
            
            if (hasError) {
                event.preventDefault();
            } else {
                // Mostrar animação de carregamento
                const loginButton = document.querySelector('.login-button');
                loginButton.classList.add('submitting');
            }
        });
    }
    
    function createValidationMessage(inputElement, message) {
        const parent = inputElement.closest('.input-wrapper');
        parent.classList.add('has-error');
        
        // Adicionar borda vermelha ao input com erro
        inputElement.style.border = '1px solid red';
        
        // Verificar se já existe uma mensagem de validação do servidor
        const serverValidation = parent.querySelector('.validation-message');
        if (serverValidation) {
            // Se já existir uma mensagem do servidor, não adicionar outra
            return;
        }
        
        const validationDiv = document.createElement('div');
        validationDiv.className = 'validation-message client-validation-message';
        
        const icon = document.createElement('i');
        icon.className = 'fa-solid fa-triangle-exclamation';
        
        const span = document.createElement('span');
        span.textContent = message;
        
        validationDiv.appendChild(icon);
        validationDiv.appendChild(span);
        
        // Para campos de senha, inserir após o wrapper de senha
        if (inputElement.id === 'password') {
            const passwordWrapper = inputElement.closest('.password-wrapper');
            passwordWrapper.parentNode.insertBefore(validationDiv, passwordWrapper.nextSibling);
        } else {
            // Para outros campos, inserir após o próprio input
            inputElement.parentNode.insertBefore(validationDiv, inputElement.nextSibling);
        }
    }
}); 