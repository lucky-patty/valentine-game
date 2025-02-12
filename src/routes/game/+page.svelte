<script lang="ts">
	import { goto } from '$app/navigation';

	//
	let isWrong: boolean = false;
	let questionList: string[] = [
		'What is my favorite food ?',
		'What is my favorite drinks ?',
		'What is my favorite hobby ?'
	];
	let choiceQuestion1: string[] = [
		'https://www.simplyrecipes.com/thmb/KE6iMblr3R2Db6oE8HdyVsFSj2A=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2019__09__easy-pepperoni-pizza-lead-3-1024x682-583b275444104ef189d693a64df625da.jpg',
		'https://www.healthyseasonalrecipes.com/wp-content/uploads/2022/06/healthy-cobb-salad-steps-sq-026.jpg'
	];
	let choiceQuestion2: string[] = [
		'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0io9Vj_4U4078UcnZyViDmjooLdz40QVbgS-Su-d_RTUNKKVOCHA_b8aGJfL7iunR-qM&usqp=CAU',
		'https://twinings.co.uk/cdn/shop/articles/How_To_Taste_Tea.jpg?v=1622729251'
	];
	let choiceQuestion3: string[] = [
		'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZHJpdmluZ3xlbnwwfHwwfHx8MA%3D%3D',
		'https://www.nationaldaycalendar.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cq_auto:eco%2Cw_1200/MjA4NzU0NjMwMjk1ODIzNTMz/national-read-a-book-day--september-6.png'
	];

    let tryAgainImage: string = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjLPBSIea_u4aGwvet6xOvhZQCFOj_hak_5A&s"

	let correctCount: number = 0;
	let wrongAnswer: boolean = false;

	async function makeCorrect() {
        if (correctCount == 2) {
            goto('/request');
        }
        correctCount++;
	}

	async function makeWrong() {
		wrongAnswer = !wrongAnswer;
		correctCount = 0; // reset it
	}

    async function reset() {
        wrongAnswer = !wrongAnswer;
        correctCount = 0;
    }
</script>

<div class="flex h-screen w-screen flex-col items-center justify-center bg-[#faf0e2] py-10">
	<div class="h-1/5 w-full">
		{#if wrongAnswer}
			<h1 class="text-center font-[Honeybee] text-5xl font-bold text-[#bb6f8c] 2xl:text-9xl">
				I thought you know me :(
			</h1>
		{:else}
			<h1 class="text-center font-[Honeybee] text-5xl font-bold text-[#bb6f8c] 2xl:text-9xl">
				{questionList[correctCount]}
			</h1>
		{/if}
	</div>
	<div class="flex h-4/5 w-full items-center justify-center gap-5">
		{#if !wrongAnswer}
			<!-- There is no wrong answer yet -->
			{#if correctCount == 0}
				<!-- Make choice -->
				<div class="flex h-full w-full flex-col xl:flex-row items-center object-contain gap-5">
					<button class="flex w-full xl:h-full flex-col items-center" onclick={makeCorrect}>
						<img class="w-3/4 md:w-80 xl:w-2/4" src={choiceQuestion1[0]} alt="choice-1" />
					</button>
					<h1 class="font-[Honeybee] text-3xl font-bold text-[#bb6f8c] xl:text-5xl xl:font-bold xl:flex xl:justify-center xl:flex-col xl:items-center xl:h-full">Versus</h1>
					<button class="flex w-full xl:h-full flex-col items-center" onclick={makeWrong}>
						<img class="w-3/4 md:w-80 xl:w-80 2xl:w-120" alt="choice-2" src={choiceQuestion1[1]} />
					</button>
				</div>
			{:else if correctCount == 1}
				<!-- Make choice -->
				<div class="flex h-full w-full flex-col  xl:flex-row items-center gap-5">
					<button class="flex w-full flex-col items-center" onclick={makeWrong}>
						<img class="w-3/4  md:w-100 2xl:w-120" src={choiceQuestion2[0]} alt="choice-1" />
					</button>
					<h1 class="font-[Honeybee] text-3xl font-bold text-[#bb6f8c]">Versus</h1>
					<button class="flex w-full flex-col items-center" onclick={makeCorrect}>
						<img class="w-3/4  md:w-100 2xl:w-120" alt="choice-2" src={choiceQuestion2[1]} />
					</button>
				</div>
			{:else if correctCount == 2}
				<!-- Make choice -->
				<div class="flex h-full w-full flex-col  xl:flex-row items-center gap-5">
					<button class="flex w-full flex-col items-center" onclick={makeWrong}>
						<img class="w-3/4  md:w-100 2xl:w-120" src={choiceQuestion3[0]} alt="choice-1" />
					</button>
					<h1 class="font-[Honeybee] text-3xl font-bold text-[#bb6f8c]">Versus</h1>
					<button class="flex w-full flex-col items-center" onclick={makeCorrect}>
						<img class="w-3/4  md:w-100 2xl:w-120" alt="choice-2" src={choiceQuestion3[1]} />
					</button>
				</div>
			{/if}
        {:else}
        <!-- Wrong Answer detected :( -->
         <div class="flex h-full w-full flex flex-col items-center gap-5">
            <button class="flex w-full flex-col items-center" onclick={reset}>
                <h1 class="font-[Honeybee] text-3xl font-bold text-[#bb6f8c]"> Try again</h1>
                <img class="w-4/5  md:w-100 2xl:w-120" alt="try-again" src={tryAgainImage}  />
            </button>
         </div>
		{/if}
	</div>
</div>
