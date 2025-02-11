<script lang="ts">
	import { goto } from '$app/navigation';

	let choiceOne: string =
		'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHEwemhjNTFlaDE5Y21wMTBiMjdlZGZkazJtNnMyOHh2YmNjN2NhbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/5PhYotn1t5s0M10Aly/giphy.gif';
	let choiceTwo: string = '';

	let yesGif: string =
		'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHVpMGo0M2dzdTc1eTkzM3ZlNjExcDZta3pzYmVsMGVoOXowcXNzYSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/Ih16mYfbCQDKw/giphy.gif';
	let gifList: string[] = [
		'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHEwemhjNTFlaDE5Y21wMTBiMjdlZGZkazJtNnMyOHh2YmNjN2NhbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/5PhYotn1t5s0M10Aly/giphy.gif',
		'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExd3JrY3R1eWxuN3Jra3o0YXVyNmdrejR0dzhiZTc4YnZjOWxxY2IzZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/jivGITd768psP80B2i/giphy.gif',
		'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExaXZweWl6Z291YXkwMHBma3Y4Ynd0N3B0a3RzbmVjZ25kZWV2ZThoMyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/beFz7ODP7OD8Q/giphy.gif',
		'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExYzY1M3Q0eTl2Z2hndHc4bXBvbnYxaTkyb3JwNjJicmNoc3ltOGhhbSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/pyFsc5uv5WPXN9Ocki/giphy.gif',
		'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExcWEyMzd0MzB0ejBuZGx3c212aWZvZDE1cHoybGVpYmp4M3R1b3A3aCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/rho9L4MsYXaec/giphy.gif',
		'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExMjFlaTY0OHg5ZjUwMm5xNzgyZWEyczNuYXV4dTJia3ZreWJzM2h0byZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/2Okete2V366ZO2HODS/giphy.gif',
		'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExanU5djU4N252aDRycnhoZG04MzFpMmw5bHM3djhlb29pd3kxYjNpMyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/oumdjgdfS0K6awiJPa/giphy.gif'
	];
	let noIndex: number = 0;
	let noQuote: string[] = [
		'No 😭',
		'Wut yyyyy 😯 ',
		'Babeeee pls 🥺',
		'I will send you back 😤',
		'Click yes 😠',
		'😡',
		'Ok I give up 😔'
	];

	let accept: boolean = false;

	async function IncreaseNoIndex() {
		if (noIndex + 1 >= noQuote.length) {
			goto('/');
		} else {
			noIndex++;
		}
	}

	async function SheSaidYes() {
		accept = true;
	}
</script>

<div class="flex h-screen w-screen flex-col items-center justify-center gap-5 bg-[#faf0e2]">
	<div class="h-1/5 w-full">
		{#if !accept}
			<h1 class="text-center font-[Balonku] text-9xl">Will you be my valentine?</h1>
		{:else}
			<h1 class="text-center font-[Cookie-Monster] text-9xl">Please read this poem</h1>
		{/if}
	</div>
	{#if accept}
		<div class="flex h-4/5 w-full flex-col justify-center items-center gap-5 overflow-y-scroll">
			<p class="w-full text-center font-[Cookie-Monster] text-7xl tracking-wide">
				My days are full, the hours race, <br />
				A whirlwind life, a frantic pace. <br />
				Yet in the chaos, through the grind, <br />
				It’s you, my love, who fills my mind. <br />
				<br />
				Meetings call, and tasks demand, <br />
				But thoughts of you are close at hand.<br />
				A fleeting glance, a quiet sigh,<br />
				I miss you more as time goes by.<br />
				<br />
				I dream of moments, slow and sweet,<br />
				Where busy hearts and schedules meet.<br />
				To share a laugh, to hold you near,<br />
				To feel your voice, so soft, so clear.<br />
				<br />
				Though life pulls me far and wide,<br />
				It’s you I want here by my side.<br />
				Through every storm, through every climb,<br />
				I wish to grow old with you, my Valentine.
			</p>
            <!-- <div class="w-full h-1/5">
                <img class="w-2/4" alt="yes" src={yesGif} />
            </div> -->
		</div>
	{:else}
		<div class="flex h-1/4 w-full flex-row items-center justify-center gap-10">
			<button class="h-2/5 w-1/5 rounded-3xl font-[Balonku] text-7xl" onclick={SheSaidYes}
				>Yes ❤️</button
			>
			<button class="h-2/5 w-1/5 rounded-3xl font-[Balonku] text-7xl" onclick={IncreaseNoIndex}
				>{noQuote[noIndex]}</button
			>
		</div>
		<div class="flex h-1/4 w-full items-center justify-center">
			{#if !accept}
				{#if noIndex == 0}
					<img
						class="h-full"
						src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExNHEwemhjNTFlaDE5Y21wMTBiMjdlZGZkazJtNnMyOHh2YmNjN2NhbyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/5PhYotn1t5s0M10Aly/giphy.gif"
						alt="gif"
					/>
				{:else}
					<img class="h-full" alt="gif" src={gifList[noIndex]} />
				{/if}
			{/if}
		</div>
	{/if}
</div>

<style>
	/* width */
	::-webkit-scrollbar {
		width: 5px;
	}

	/* Track */
	::-webkit-scrollbar-track {
		background: #bb6f8c;
	}

	/* Handle */
	::-webkit-scrollbar-thumb {
		background: #7ea1cf;
	}

	/* Handle on hover */
	/* ::-webkit-scrollbar-thumb:hover {
  background: #555;
} */
</style>
