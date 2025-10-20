import mongoose from "mongoose";

const UserSchema = new mongoose.Schema({
	username: { type: String, required: true, unique: true },
	password: { type: String, required: true },
	favorites: [{ type: String }],
	subscription: {
		type: String,
		enum: [
			"1 Day Ticket",
			"Monthly",
			"eVillo Option",
			"Villo Business",
			"Villo Promotion",
			"Brussels Card",
			null,
		],
		default: null,
	},
});

export default mongoose.model("User", UserSchema);
