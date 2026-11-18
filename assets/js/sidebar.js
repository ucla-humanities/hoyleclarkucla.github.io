document.addEventListener('DOMContentLoaded', () => {
    const sidebarLinks = document.querySelectorAll('.sidebar li > a');
    
    sidebarLinks.forEach(link => {
        const parentLi = link.parentElement;
        const subMenu = parentLi.querySelector('ul');
        
        if (subMenu) {
            link.addEventListener('click', (e) => {
                // Determine if the user clicked on the edge where the arrow resides
                // (e.clientX detects how far right they clicked inside the link)
                const linkWidth = link.offsetWidth;
                const clickX = e.offsetX;
                
                // If they clicked within 35px of the right edge (where the arrow is),
                // toggle the menu and prevent navigation.
                if (linkWidth - clickX < 35) {
                    e.preventDefault(); 
                    
                    if (parentLi.classList.contains('open')) {
                        parentLi.classList.remove('open');
                    } else {
                        // Collapse neighboring open sibling folders at the same tree depth
                        const siblings = parentLi.parentElement.children;
                        for (let sibling of siblings) {
                            if (sibling !== parentLi) {
                                sibling.classList.remove('open');
                            }
                        }
                        parentLi.classList.add('open');
                    }
                    
                    // Keep parent folders further up the tree open
                    let ancestor = parentLi.parentElement.closest('li');
                    while (ancestor) {
                        ancestor.classList.add('open');
                        ancestor = ancestor.parentElement.closest('li');
                    }
                }
                // Otherwise, let the browser naturally navigate to the link's href!
            });
        }
    });
});