document.addEventListener('DOMContentLoaded', () => {
    const pages = document.querySelectorAll('.page');
    const navButtons = document.querySelectorAll('.nav-btn');

    navButtons.forEach(btn => {
        btn.addEventListener('click', (e) => {
            document.getElementById('side-menu').classList.remove('open');
            const targetId = e.currentTarget.getAttribute('data-target');
            pages.forEach(page => page.classList.remove('active'));
            document.getElementById(targetId).classList.add('active');
        });
    });

    const sideMenu = document.getElementById('side-menu');
    const openMenuBtns = document.querySelectorAll('.open-menu-btn');
    const closeMenuBtn = document.getElementById('close-menu-btn');

    openMenuBtns.forEach(btn => {
        btn.addEventListener('click', () => sideMenu.classList.add('open'));
    });
    closeMenuBtn.addEventListener('click', () => sideMenu.classList.remove('open'));

    const levelGrid = document.getElementById('level-grid');
    const levelData = [
        { id: 1, status: 'none' }, { id: 2, status: 'perfect' }, 
        { id: 3, status: 'good' }, { id: 4, status: 'bad' },
        { id: 5, status: 'none' }, { id: 6, status: 'none' },
        { id: 7, status: 'none' }, { id: 8, status: 'none' },
        { id: 9, status: 'none' }, { id: 10, status: 'none' },
        { id: 11, status: 'none' }, { id: 12, status: 'none' }
    ];

    levelData.forEach(level => {
        const card = document.createElement('div');
        card.className = 'level-card';
        
        let statusText = 'Not done';
        let statusClass = 'status-none';
        
        if (level.status === 'perfect') { statusText = 'PERFECT'; statusClass = 'status-perfect'; }
        else if (level.status === 'good') { statusText = 'GOOD'; statusClass = 'status-good'; }
        else if (level.status === 'bad') { statusText = 'BAD'; statusClass = 'status-bad'; }

        card.innerHTML = `
            <h3>Level ${level.id}</h3>
            <span class="level-status ${statusClass}">${statusText}</span>
        `;
        
        card.addEventListener('click', () => {
            openModal(`Level ${level.id} 목표`, `최소한의 게이트를 사용하여 이 레벨을 클리어하세요.`);
        });
        levelGrid.appendChild(card);
    });

    const modal = document.getElementById('info-modal');
    const modalTitle = document.getElementById('modal-title');
    const modalDesc = document.getElementById('modal-desc');
    const closeModalBtn = document.getElementById('close-modal-btn');
    const infoButtons = document.querySelectorAll('.info-btn');

    infoButtons.forEach(btn => {
        btn.addEventListener('click', (e) => {
            const infoText = e.currentTarget.getAttribute('data-info');
            openModal('게이트 상세 설명', infoText);
        });
    });

    closeModalBtn.addEventListener('click', () => modal.classList.remove('active'));

    function openModal(title, desc) {
        modalTitle.textContent = title;
        modalDesc.textContent = desc;
        modal.classList.add('active');
    }
});
