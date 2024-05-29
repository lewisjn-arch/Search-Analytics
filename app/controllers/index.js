document.addEventListener('DOMContentLoaded', () => {
	const searchInput = document.querySelector('#search-input');
	const resultsDiv = document.querySelector('#results');

	if (searchInput) {
		searchInput.addEventListener('input', () => {
			fetch(`/articles?query=${searchInput.value}`, { headers: { 'Accept': 'application/json' } })
				.then(response => response.json())
				.then(data => {
					resultsDiv.innerHTML = '';
					data.forEach(article => {
						const articleDiv = document.createElement('div');
						articleDiv.innerHTML = `<h2>${article.title}</h2><p>${article.content}</p>`;
						resultsDiv.appendChild(articleDiv);
					});
				});
		});
	}
});
