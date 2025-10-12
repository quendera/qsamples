(
// Route outputs of d1-d6 to Ndef;
Ndef(\d1).ar(2);
~dirt.orbits[0].outBus = Ndef(\d1).bus;
Ndef(\d2).ar(2);
~dirt.orbits[1].outBus = Ndef(\d2).bus;
Ndef(\d3).ar(2);
~dirt.orbits[2].outBus = Ndef(\d3).bus;
Ndef(\d4).ar(2);
~dirt.orbits[3].outBus = Ndef(\d4).bus;
Ndef(\d5).ar(2);
~dirt.orbits[4].outBus = Ndef(\d5).bus;
Ndef(\d6).ar(2);
~dirt.orbits[5].outBus = Ndef(\d6).bus;

Ndef(\Master, {
	var dry, sig;

	// Receive d1-d6 outputs in the variable dry
	dry = [Ndef.ar(\d1),Ndef.ar(\d2),Ndef.ar(\d3),Ndef.ar(\d4),Ndef.ar(\d5),Ndef.ar(\d6)];

	// Output d1-d6 from outs [2,3] to [12,13]
	6.do({
		arg i;
		Out.ar((i*2)+2, dry[i]);
	});

	// Merge dry outputs into variable sig
	sig = dry[0] + dry[1] + dry[2] + dry[3] + dry[4] + dry[5];

	// Limiter on final output;
	sig = Limiter.ar(sig*3);
}).play;
);