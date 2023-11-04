import Keeper from "App/Models/Keeper";

export default class KeeperService {
    public async createKeeper(): Promise<Keeper> {
        return await Keeper.create({})
    }

    public async getKeeper(id: string): Promise<Keeper|null> {
        return await Keeper.find(id)
    }
}
