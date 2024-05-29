document.addEventListener('DOMContentLoaded', () => {
	const searchInput = document.querySelector('#search-input');
	const resultsDiv = document.querySelector('#results');

	if (searchInput) {
		let lastSearchQuery = '';

		searchInput.addEventListener('input', () => {
			const query = searchInput.value.trim();

			if (query && query !== lastSearchQuery) {
				lastSearchQuery = query;
				fetch(`/articles?query=${encodeURIComponent(query)}`, { headers: { 'Accept': 'application/json' } })
					.then(response => response.json())
					.then(data => {
						resultsDiv.innerHTML = '';
						data.forEach(article => {
							const articleDiv = document.createElement('div');
							articleDiv.innerHTML = `<h2>${article.title}</h2><p>${article.content}</p>`;
							resultsDiv.appendChild(articleDiv);
						});
					});
			}
		});
	}
});
