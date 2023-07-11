<%-- 
    Document   : end
    Created on : Mar 16, 2023, 12:40:31 AM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <script src="assets/js/jquery-3.6.0.js"></script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
        <!-- bootstrap js -->
        <script src="assets/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
        <!-- custom js -->
        <script src="assets/js/script.js"></script>
  <script>
    function closeDropdown() {
        var dropdownMenu = document.querySelector('.dropdown-menu');
        var bsDropdown = bootstrap.Dropdown.getInstance(dropdownMenu.parentNode);
        bsDropdown.hide();
    }
</script>
    </body>
</html>
